import 'package:attendence/auth/authiaction.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpFetchEvent>((event, emit)async {
      emit.call(SignUpLoadingState());
      try {
        
        User? user = await signUp(event.name, event.email, event.password);
        print('############################');
        emit.call(SignUpLoadedState(user)); 
      } on FirebaseAuthException catch(e){
        emit(SignUpErrorState(e.toString()));
      }
      
      catch (e) {
        emit(SignUpErrorState(e.toString())); 
      }
    });
  }
}
