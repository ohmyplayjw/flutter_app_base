import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/vo_court_list.dart';
import '../../data/models/vo_court_param.dart';
import '../../data/models/vo_default_param.dart';
import '../../data/models/vo_referee_list.dart';
import '../../data/models/vo_reservation_list.dart';
import '../../data/network/result/api_error.dart';
import '../../data/repositories/gym_repository_impl.dart';
import '../../data/simple_result.dart';
import '../../domain/usecase/gym_usecase.dart';

final gymRepositoryProvider = Provider<GymRepositoryImpl>((ref) {
  return GymRepositoryImpl.instance;
});

final gymUseCaseProvider = Provider<GymUseCase>((ref) {
  final repository = ref.read(gymRepositoryProvider);
  return GymUseCase(repository);
});

final courtsProvider =
    FutureProvider.family<SimpleResult<CourtList, ApiError>, DefaultParam>(
        (ref, defaultParam) async {
  final courtsUseCase = ref.read(gymUseCaseProvider);
  return await courtsUseCase.getCourts(defaultParam);
});

final reservationInfoProvider =
    FutureProvider.family<SimpleResult<ReservationList, ApiError>, CourtParam>(
        (ref, courtParam) async {
  final gymUseCase = ref.read(gymUseCaseProvider);
  return await gymUseCase.getReservations(courtParam);
});

final refereesProvider =
    FutureProvider.family<SimpleResult<RefereeList, ApiError>, DefaultParam>(
        (ref, defaultParam) async {
  final gymUseCase = ref.read(gymUseCaseProvider);
  return await gymUseCase.getReferees(defaultParam);
});
