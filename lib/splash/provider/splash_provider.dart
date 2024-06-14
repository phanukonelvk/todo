import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/core/shared/catch_user_service/domain/provider/user_cache_provider.dart';

final userLoginCheckProvider = FutureProvider((ref) async {
    final repo = ref.watch(userLocalRepositoryProvider);
    return await repo.hasUser();
  });

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});