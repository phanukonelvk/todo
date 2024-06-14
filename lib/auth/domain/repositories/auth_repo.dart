import 'package:todo_example/auth/data/model/refresh_token_model.dart';
import 'package:todo_example/auth/data/model/sig_in_model.dart';
import 'package:todo_example/auth/data/model/sig_in_response_model.dart';
import 'package:todo_example/core/typeDefs/type_defs.dart';

abstract class AuthRepo {
  FutureEither<SiginResponse> siginRepo({SiginRequest? request});
  FutureEither<RefreshTokenModel> refreshRepo({SiginRequest? request});
}
