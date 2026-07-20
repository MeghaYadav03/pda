import 'package:pda/common/models/user_model.dart';
import 'package:pda/common/services/login_service.dart';
import 'package:pda/modules/login/bloc/login_event.dart';
import 'package:pda/modules/login/bloc/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:pda/modules/login/login_result.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final LoginService loginService = LoginService();

  LoginBloc(): super(LoginInitial()){
    
    on<LoginButtonPressed>((event,emit)async{
      emit(LoginLoading());
      print("emited loading");
      try{
        LoginResult loginResult = await loginService.auth(salesmanId: event.salesmanId,password:  event.password);
      if(loginResult.success){
        print("emited success");

        emit(LoginSuccess(user: loginResult.user!));
      }
      else{
        print("emited failure");
        emit(LoginFailure(errorMessage: loginResult.message!));
      }
      }
      catch(e){
        emit(LoginFailure(errorMessage: e.toString()));
      }
    });
  }
}
