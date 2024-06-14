import 'package:fpdart/fpdart.dart';
import 'package:todo_example/core/error/failures.dart';

typedef FutureEither<T> = Future<Either<AppFailure, T>>;
typedef FutureVoid = FutureEither<void>;