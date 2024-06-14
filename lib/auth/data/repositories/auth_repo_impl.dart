import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:todo_example/auth/data/datasource/local/auth_local_data_source.dart';
import 'package:todo_example/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:todo_example/auth/data/model/refresh_token_model.dart';
import 'package:todo_example/auth/data/model/sig_in_model.dart';
import 'package:todo_example/auth/data/model/sig_in_response_model.dart';
import 'package:todo_example/auth/domain/repositories/auth_repo.dart';
import 'package:todo_example/core/error/exceptions.dart';
import 'package:todo_example/core/error/failures.dart';
import 'package:todo_example/core/shared/local/storage_service.dart';
import 'package:todo_example/core/shared/localexaple/loacal_data.dart';
import 'package:todo_example/core/shared/local/local_key.dart';
import 'package:todo_example/core/typeDefs/type_defs.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource? _authRemoteDataSource;
  // final AuthLocalDataSource? _authLocalDataSource;
  final StorageService? _storageService;

  AuthRepoImpl({
    AuthRemoteDataSource? authRemoteDataSource,
    StorageService? storageService,
  })  : _authRemoteDataSource = authRemoteDataSource,
        // _authLocalDataSource = authLocalDataSource,
        _storageService = storageService;

  @override
  FutureEither<SiginResponse> siginRepo({SiginRequest? request}) async {
    try {
      SiginResponse siginModelRemoteDataSource = await _authRemoteDataSource!
          .signInSignUpRemoteDataSrc(request: request);
      // Save the token to local storage
      // await _storageService?.set(
      //     LocalKeyData.ACCESS_TOKEN_KEY, siginModelRemoteDataSource.token);
      // LocalData.setAssetsToken(value: siginModelRemoteDataSource.token);
      LocalData.setLoggedIn(value: true);
      return right(siginModelRemoteDataSource);
    } on SocketException catch (e) {
      return left(AppServerFailure(e.message.toString()));
    } on AppServerException catch (e) {
      return left(AppServerFailure(e.message.toString()));
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }

  @override
  FutureEither<RefreshTokenModel> refreshRepo({SiginRequest? request}) async {
    try {
      RefreshTokenModel refreshTokenModelRemoteDataSrc =
          await _authRemoteDataSource!.refreshToken();
      await _storageService!.set(LocalKeyData.ACCESS_TOKEN_KEY,
          refreshTokenModelRemoteDataSrc.refreshToken);
      // LocalData.setLoggedIn(value: true);
      return right(refreshTokenModelRemoteDataSrc);
    } on SocketException catch (e) {
      return left(AppServerFailure(e.message.toString()));
    } on AppServerException catch (e) {
      return left(AppServerFailure(e.message.toString()));
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
