import 'package:com.ohmyplay.badminton_scoreboard_elite/common/common.dart';
import 'package:com.ohmyplay.badminton_scoreboard_elite/common/language/language.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../domain/model/vo_court.dart';
import '../controller/auth_controller.dart';
import '../controller/gym_controller.dart';
import 'game_ready/s_game_ready.dart';
import 'login/s_login.dart';

final selectedCourtProvider = StateProvider<Court?>((ref) => null);
final currentPageProvider = StateProvider((ref) => "");
final courtListProvider = FutureProvider<List<Court>>((ref) async {
  final defaultParam = ref.watch(defaultParamProvider);
  if (defaultParam == null) {
    throw Exception('Default parameters are not set');
  }
  final courtsUseCase = ref.read(gymUseCaseProvider);
  final result = await courtsUseCase.getCourts(defaultParam);
  if (result.isSuccess) {
    return result.successData.courts;
  } else {
    throw Exception(result.failureData.message);
  }
});

class CourtEntranceScreen extends ConsumerWidget {
  const CourtEntranceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gym = ref.watch(loginResponseProvider);
    final courtsAsyncValue = ref.watch(courtListProvider);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: (gym == null) ? ''.text.make() : gym.gymName.text.make(),
          elevation: 1,
          shadowColor: const Color.fromARGB(8, 0, 0, 0),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text("LOGOUT"))
          ]),
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(34, 0, 0, 0), BlendMode.dstATop),
              image: AssetImage('$basePath/background/bg_court_selection.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        courtsAsyncValue.when(
          data: (courtList) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(
                    'court_select'.tr(),
                    style: TextStyle(fontSize: 18),
                  ),
                  pinned: true,
                  leading: const Icon(
                    Icons.info_outline,
                    color: Colors.black,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Tap(
                          child: Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              margin:
                                  const EdgeInsets.only(left: 15, right: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: context.appColors.veryBrightGrey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: context.appColors.drawerBg,
                                  boxShadow: [
                                    context.appShadows.buttonShadowSmall
                                  ]),
                              child: Row(
                                children: [
                                  const Width(10),
                                  DropdownButton<String>(
                                    items: [
                                      menu(currentLanguage),
                                      menu(Language.values
                                          .where((element) =>
                                              element != currentLanguage)
                                          .first),
                                    ],
                                    onChanged: (value) async {
                                      if (value == null) {
                                        return;
                                      }
                                      await context.setLocale(
                                          Language.find(value.toLowerCase())
                                              .locale);
                                    },
                                    value: describeEnum(currentLanguage)
                                        .capitalizeFirst,
                                    underline: const SizedBox.shrink(),
                                    elevation: 1,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ],
                              )),
                          onTap: () async {},
                        ),
                      ],
                    )
                  ],
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => CourtCard(court: courtList[index]),
                      childCount: courtList.length,
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (Object error, StackTrace stackTrace) {
            return Center(child: Text('Error: $error'));
          },
        ),
      ]),
    );
  }
}

class CourtCard extends ConsumerWidget {
  final Court court;

  const CourtCard({super.key, required this.court});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${'court'.tr()}${court.courtNum}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: const Color.fromARGB(255, 111, 190, 255),
                  minimumSize: const Size(200, 50),
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                ref.read(selectedCourtProvider.notifier).state = court;
                Nav.push(GameReadyScreen(court: court));
              },
              child: Text('umpire'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getLanguageOption(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Tap(
          child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              margin: const EdgeInsets.only(left: 15, right: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: context.appColors.veryBrightGrey),
                  borderRadius: BorderRadius.circular(10),
                  color: context.appColors.drawerBg,
                  boxShadow: [context.appShadows.buttonShadowSmall]),
              child: Row(
                children: [
                  const Width(10),
                  DropdownButton<String>(
                    items: [
                      menu(currentLanguage),
                      menu(Language.values
                          .where((element) => element != currentLanguage)
                          .first),
                    ],
                    onChanged: (value) async {
                      if (value == null) {
                        return;
                      }
                      await context
                          .setLocale(Language.find(value.toLowerCase()).locale);
                    },
                    value: describeEnum(currentLanguage).capitalizeFirst,
                    underline: const SizedBox.shrink(),
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ],
              )),
          onTap: () async {},
        ),
      ],
    );
DropdownMenuItem<String> menu(Language language) {
  return DropdownMenuItem(
    value: describeEnum(language).capitalizeFirst,
    child: Row(
      children: [
        flag(language.flagPath),
        const Width(8),
        describeEnum(language)
            .capitalizeFirst!
            .text
            .size(12)
            .makeWithDefaultFont(),
      ],
    ),
  );
}

Widget flag(String path) {
  return SimpleShadow(
    opacity: 0.5,
    // Default: 0.5
    color: Colors.grey,
    // Default: Black
    offset: const Offset(2, 2),
    // Default: Offset(2, 2)
    sigma: 2,
    // Default: 2
    child: Image.asset(
      path,
      width: 20,
    ),
  );
}
