import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/vo_default_param.dart';
import '../../../data/models/vo_gym.dart';
import '../../../data/models/vo_gym_list.dart';
import '../../../data/models/vo_liveop_response.dart';
import '../../../data/models/vo_login_response.dart';
import '../../../data/models/vo_scoreboard_setting.dart';
import '../../../data/network/result/api_error.dart';
import '../../../data/simple_result.dart';
import '../../../domain/model/login_param.dart';
import '../../controller/auth_controller.dart';
import '../s_court_entrance.dart';

// Providers
final loginResponseProvider = StateProvider<LoginResponse?>((ref) => null);
final tableUseRequestProvider = StateProvider<LiveopResponse?>((ref) => null);
final scoreboardSettingProvider =
    StateProvider<ScoreboardSetting?>((ref) => null);
final isLoadingProvider = StateProvider<bool>((ref) => false);
final isLoadingGymsProvider = StateProvider<bool>((ref) => false);

final isRequestTabletUseLoadingProvider = StateProvider<bool>((ref) => false);
final gymListProvider = StateProvider<List<Gym>>((ref) => []);
final selectedGymProvider =
    StateProvider<Gym>((ref) => const Gym(gymId: '', gymName: ''));
final isCameraChangedProvider = StateProvider<bool>((ref) => false);

class LoginScreen extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tournamentIdController = TextEditingController();
  final TextEditingController _tournamentPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      // 초기화 로직
      _getRecentGyms(ref).then((result) {
        if (result != null && result.isSuccess) {
          ref.read(gymListProvider.notifier).state = result.successData.gyms;
          if (result.successData.gyms.isNotEmpty) {
            ref.read(selectedGymProvider.notifier).state =
                result.successData.gyms.first;
          }
        }
      });
      return null;
    }, []);
    final isLoading = ref.watch(isLoadingProvider);
    final isRequestTabletUseLoading =
        ref.watch(isRequestTabletUseLoadingProvider);
    final gyms = ref.watch(gymListProvider);
    final selectedGym = ref.watch(selectedGymProvider);
    final isTournamentIdChecked = useState(false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('$basePath/background/bg_login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'OH MY PLAY',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      const Text('Badminton Digital Scoreboard',
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 20),
                      if (!isTournamentIdChecked.value)
                        SizedBox(
                          width: 450,
                          child: DropdownButtonFormField<Gym>(
                            value: selectedGym,
                            items: gyms.map((gym) {
                              return DropdownMenuItem<Gym>(
                                value: gym,
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 420),
                                  child: Text(
                                    gym.gymName,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (Gym? newValue) {
                              if (newValue != null) {
                                ref.read(selectedGymProvider.notifier).state =
                                    newValue;
                              }
                            },
                          ),
                        ),
                      if (isTournamentIdChecked.value)
                        SizedBox(
                          width: 450,
                          child: TextFormField(
                            controller: _tournamentIdController,
                            decoration: const InputDecoration(
                              labelText: 'Tournament ID',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the Tournament ID';
                              }
                              return null;
                            },
                          ),
                        ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 450,
                        child: TextFormField(
                          controller: _tournamentPasswordController,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: CheckboxListTile(
                          title: const Text('Login with Tournament ID'),
                          value: isTournamentIdChecked.value,
                          onChanged: (bool? value) {
                            isTournamentIdChecked.value = value ?? false;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: context.appColors.blueBtnColor,
                                minimumSize: const Size(300, 50),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  ref.read(isLoadingProvider.notifier).state =
                                      true;

                                  if (isTournamentIdChecked.value) {
                                    final loginResponse = await _login(
                                      ref,
                                      _tournamentIdController.text,
                                      _tournamentPasswordController.text,
                                    );
                                    ref.read(isLoadingProvider.notifier).state =
                                        false;
                                    if (loginResponse != null &&
                                        loginResponse.isSuccess) {
                                      ref
                                              .read(defaultParamProvider.notifier)
                                              .state =
                                          DefaultParam(
                                              gymId: loginResponse
                                                  .successData.gymId,
                                              loginKey: loginResponse
                                                  .successData.loginKey,
                                              macAddress: getMacAddress());
                                      Nav.push(const CourtEntranceScreen());
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Login failed. Please try again.')),
                                      );
                                    }
                                  } else {
                                    final loginResponse = await _login(
                                      ref,
                                      selectedGym.gymId,
                                      _tournamentPasswordController.text,
                                    );
                                    ref.read(isLoadingProvider.notifier).state =
                                        false;
                                    if (loginResponse != null &&
                                        loginResponse.isSuccess) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CourtEntranceScreen()),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Login failed. Please try again.')),
                                      );
                                    }
                                  }
                                }
                              },
                              child: const Text('Login',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                      const SizedBox(height: 20),
                      isRequestTabletUseLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                minimumSize: const Size(300, 50),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (!isTournamentIdChecked.value) {
                                    final tabletUseRequestResponse =
                                        await _tabletUseRequest(
                                            ref, selectedGym.gymId);
                                    ref
                                        .read(isRequestTabletUseLoadingProvider
                                            .notifier)
                                        .state = false;
                                    if (tabletUseRequestResponse != null) {
                                      if (tabletUseRequestResponse.isSuccess) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Tablet 사용 승인을 요청하였습니다.')),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Request failed. Please try again.')),
                                      );
                                    }
                                  } else {
                                    final tabletUseRequestResponse =
                                        await _tabletUseRequest(
                                            ref, _tournamentIdController.text);
                                    ref
                                        .read(isRequestTabletUseLoadingProvider
                                            .notifier)
                                        .state = false;
                                    if (tabletUseRequestResponse != null) {
                                      if (tabletUseRequestResponse.isSuccess) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Tablet 사용 승인을 요청하였습니다.')),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Request failed. Please try again.')),
                                      );
                                    }
                                  }
                                }
                              },
                              child: const Text('Table Use Request'),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<SimpleResult<LoginResponse, ApiError>?> _login(
      WidgetRef ref, String id, String password) async {
    try {
      final authUseCase = ref.read(authUseCaseProvider);
      final loginParam = LoginParam(gymId: id, macAddress: 'macAddress');
      final result = await authUseCase.signIn(loginParam);
      ref.read(loginResponseProvider.notifier).state = result.successData;
      final scoreboardSettingResponse =
          await authUseCase.scoreboardSetting(loginParam);

      final defaultParam = DefaultParam(
          gymId: result.successData.gymId,
          loginKey: result.successData.loginKey,
          macAddress: getMacAddress());
      ref.read(defaultParamProvider.notifier).state = defaultParam;
      if (scoreboardSettingResponse.isSuccess) {
        ref.read(scoreboardSettingProvider.notifier).state =
            scoreboardSettingResponse.successData;
      }
      return result;
    } catch (e) {
      return null;
    }
  }

  Future<SimpleResult<LiveopResponse, ApiError>?> _tabletUseRequest(
      WidgetRef ref, String id) async {
    ref.read(isRequestTabletUseLoadingProvider.notifier).state = true;
    try {
      final authUseCase = ref.read(authUseCaseProvider);
      final macAddress = getMacAddress(); // 실제 MAC 주소를 가져오는 함수 구현 필요
      final loginParam = LoginParam(gymId: id, macAddress: macAddress);
      final result = await authUseCase.tabletUseRequest(loginParam);
      return result;
    } catch (e) {
      return SimpleResult.failure(ApiError(message: e.toString()));
    } finally {
      ref.read(isRequestTabletUseLoadingProvider.notifier).state = false;
    }
  }

  String getMacAddress() {
    return 'macAddress';
  }

  Future<SimpleResult<GymList, ApiError>?> _getRecentGyms(WidgetRef ref) async {
    final authUseCase = ref.read(authUseCaseProvider);
    final recentGyms = await authUseCase.recentGymList();
    return recentGyms;
  }
}
