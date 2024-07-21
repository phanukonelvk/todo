import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/auth/data/model/sig_in_response_model.dart';
import 'package:todo_example/core/shared/catch_user_service/domain/provider/user_cache_provider.dart';

final currentUserProvider = FutureProvider<SiginResponse?>((ref) async {
  final repository = ref.watch(userLocalRepositoryProvider);
  final eitherType = await repository.fetchUser();

  return eitherType.fold((l) => null, (r) => r);
});
