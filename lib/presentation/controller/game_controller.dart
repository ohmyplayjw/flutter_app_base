import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/game_repository_impl.dart';
import '../../domain/usecase/game_usecase.dart';

final gameRepositoryProvider = Provider<GameRepositoryImpl>((ref) {
  return GameRepositoryImpl.instance;
});

final gameUseCaseProvider = Provider<GameUseCase>((ref) {
  final repository = ref.read(gameRepositoryProvider);
  return GameUseCase(repository);
});
