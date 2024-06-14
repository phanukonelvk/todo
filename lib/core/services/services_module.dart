import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/core/services/local/shared_preferences_storage_service_provider.dart';
import 'package:todo_example/core/services/remote/api_client.dart';

final apiClientSvcProvider = Provider((ref) => ApiClientSvcImpl(
      storageService: ref.read(storageServiceProvider),
    ));
