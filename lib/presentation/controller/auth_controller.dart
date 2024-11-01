import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/vo_default_param.dart';
import '../../data/models/vo_login_response.dart';
import '../../data/network/result/api_error.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/simple_result.dart';
import '../../domain/model/login_param.dart';
import '../../domain/usecase/auth_usecase.dart';

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  return AuthRepositoryImpl.instance;
});

final defaultParamProvider = StateProvider<DefaultParam?>((ref) => null);

final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return AuthUseCase(repository);
});

final authProvider =
    FutureProvider.family<SimpleResult<LoginResponse, ApiError>, LoginParam>(
        (ref, loginParam) async {
  final loginUseCase = ref.read(authUseCaseProvider);
  return await loginUseCase.signIn(loginParam);
});
