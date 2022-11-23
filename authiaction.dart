import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

Future<User?> signinWithGoogle()async{
  final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>['Email']).signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  final credendial = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);
  var user = await FirebaseAuth.instance.signInWithCredential(credendial);
  User? myuser = user.user;
  return myuser;
}

Future<User?> signIn(String email,String password)async{
  UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
  User? user =userCredential.user;
  return Future(() => user );
}

Future<User?> signUp(String name,String email,String password)async{
  UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
  User? user = userCredential.user;
  if (user != null) {
    await sendToFirebase(name, email, password, user.uid);
    
    
  }
  return Future(() => user,);
}

Future<void> sendToFirebase(String name, String email,String password,String uid)async{
  await firebaseFirestore.collection('User').doc(uid).set({'User_Name':name,'Email':email,'Password':password,'uid':uid});
}