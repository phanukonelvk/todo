import 'package:todo_example/auth/data/model/refresh_token_model.dart';
import 'package:todo_example/auth/data/model/sig_in_model.dart';
import 'package:todo_example/auth/data/model/sig_in_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<SiginResponse> signInSignUpRemoteDataSrc({SiginRequest? request});
  Future<RefreshTokenModel> refreshToken();
}
