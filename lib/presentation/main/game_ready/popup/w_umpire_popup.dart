import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/vo_default_param.dart';
import '../../../../data/models/vo_liveop_response.dart';
import '../../../../data/models/vo_refereeId.dart';
import '../../../../data/models/vo_referee_enroll_param.dart';
import '../../../../data/models/vo_referee_list.dart';
import '../../../../data/models/vo_referee_param.dart';
import '../../../../data/network/result/api_error.dart';
import '../../../../data/simple_result.dart';
import '../../../../domain/model/vo_referee.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/gym_controller.dart';
import '../s_game_ready.dart';
import '../s_position_setting.dart';

void showUmpirePopup(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child:
                    Text('select_umpire'.tr(), style: TextStyle(fontSize: 24)),
              ),
              const Expanded(
                child: SizedBox(
                    child: SingleChildScrollView(child: UmpirePopupContent())),
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      child: TextButton(
                        child: Text(
                          'cancel'.tr(),
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      child: Text(
                        'save'.tr(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        final umpire = ref.read(selectedUmpireProvider);
                        final serviceJudge =
                            ref.read(selectedServiceJudgeProvider);
                        final reservationNum = ref.read(reservationProvider);
                        if (umpire != null) {
                          final defaultParam = ref.read(defaultParamProvider);
                          _enrollReferees(ref, defaultParam!,
                              reservationNum!.reservationNum, umpire.refereeId!,
                              refereeSupportId: serviceJudge?.refereeId!);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PositionSettingScreen()),
                          );
                        } else {
                          // Show an error message if no umpire is selected
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('plz_select_umpire'.tr())),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void addUmpirePopup(BuildContext context, WidgetRef ref) {
  final formKey = GlobalKey<FormState>();
  final umpireNameTEC = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('add_umpire'.tr()),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: TextFormField(
              controller: umpireNameTEC,
              decoration: InputDecoration(labelText: 'enter_name'.tr()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'cancel'.tr(),
              style: const TextStyle(fontSize: 24),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(
              'save'.tr(),
              style: const TextStyle(fontSize: 24),
            ),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final defaultParam = ref.read(defaultParamProvider);
                final result = await _addReferees(
                  ref,
                  defaultParam!,
                  umpireNameTEC.text,
                  'L',
                );
                if (result != null && result.isSuccess) {
                  final newReferee = result.successData;
                  ref.read(refereeListProvider.notifier).addReferee(Referee(
                      gymId: defaultParam.gymId,
                      refereeId: newReferee.refereeId,
                      refereeName: umpireNameTEC.text));
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        ],
      );
    },
  );
}

class UmpirePopupContent extends ConsumerStatefulWidget {
  const UmpirePopupContent({
    Key? key,
  }) : super(key: key);

  @override
  _UmpirePopupContentState createState() => _UmpirePopupContentState();
}

class _UmpirePopupContentState extends ConsumerState<UmpirePopupContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initValues();
    });
  }

  void initValues() async {
    final defaultParam = ref.read(defaultParamProvider);
    final result = await _getReferees(ref, defaultParam!);
    if (result != null && result.isSuccess) {
      ref
          .read(refereeListProvider.notifier)
          .setReferees(result.successData.referees);
    }
  }

  @override
  Widget build(BuildContext context) {
    final referees = ref.watch(refereeListProvider);
    final selectedUmpire = ref.watch(selectedUmpireProvider);
    final selectedServiceJudge = ref.watch(selectedServiceJudgeProvider);

    return SizedBox(
      child: Column(
        children: [
          Text('umpire1'.tr(), style: const TextStyle(fontSize: 16)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<Referee>(
              value: selectedUmpire,
              items: referees.map((referee) {
                return DropdownMenuItem<Referee>(
                  value: referee,
                  child: Text(referee.refereeName),
                );
              }).toList(),
              onChanged: (Referee? newValue) {
                if (newValue != null) {
                  ref.read(selectedUmpireProvider.notifier).state = newValue;
                }
              },
            ),
          ),
          const SizedBox(height: 32),
          Text('service_judge'.tr(), style: const TextStyle(fontSize: 16)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<Referee>(
              value: selectedServiceJudge,
              items: referees.map((referee) {
                return DropdownMenuItem<Referee>(
                  value: referee,
                  child: Text(referee.refereeName),
                );
              }).toList(),
              onChanged: (Referee? newValue) {
                ref.read(selectedServiceJudgeProvider.notifier).state =
                    newValue;
              },
            ),
          ),
          const SizedBox(height: 32),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "add_umpire_comment".tr(),
                style: const TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () => addUmpirePopup(context, ref),
                child: Text(
                  'add_umpire'.tr(),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<SimpleResult<RefereeList, ApiError>?> _getReferees(
    WidgetRef ref, DefaultParam defaultParam) async {
  final courtUseCase = ref.read(gymUseCaseProvider);
  try {
    final result = await courtUseCase.getReferees(defaultParam);
    return result;
  } catch (e) {
    return null;
  }
}

Future<SimpleResult<RefereeId, ApiError>?> _addReferees(WidgetRef ref,
    DefaultParam defaultParam, String refereeName, String refereeType) async {
  final gymUseCase = ref.read(gymUseCaseProvider);
  final RefereeParam refereeParam = RefereeParam(
      gymId: defaultParam.gymId,
      loginKey: defaultParam.loginKey,
      macAddress: defaultParam.macAddress,
      refereeName: refereeName,
      refereeType: refereeType);
  try {
    final result = await gymUseCase.addReferee(refereeParam);
    return result;
  } catch (e) {
    return null;
  }
}

Future<SimpleResult<LiveopResponse, ApiError>?> _enrollReferees(
    WidgetRef ref, DefaultParam defaultParam, int reservationNum, int refereeId,
    {int? refereeSupportId}) async {
  final gymUseCase = ref.read(gymUseCaseProvider);
  final RefereeEnrollParam refereeEnrollParam = RefereeEnrollParam(
      gymId: defaultParam.gymId,
      loginKey: defaultParam.loginKey,
      macAddress: defaultParam.macAddress,
      reservationNum: reservationNum,
      refereeId: refereeId,
      refereeSupportId: refereeSupportId);
  try {
    final result = await gymUseCase.enrollReferees(refereeEnrollParam);
    return result;
  } catch (e) {
    return null;
  }
}

final refereeListProvider =
    StateNotifierProvider<RefereeListNotifier, List<Referee>>((ref) {
  return RefereeListNotifier();
});

class RefereeListNotifier extends StateNotifier<List<Referee>> {
  RefereeListNotifier() : super([]);

  void setReferees(List<Referee> referees) {
    state = referees;
  }

  void addReferee(Referee referee) {
    state = [...state, referee];
  }
}

final selectedUmpireProvider = StateProvider<Referee?>((ref) => null);
final selectedServiceJudgeProvider = StateProvider<Referee?>((ref) => null);
