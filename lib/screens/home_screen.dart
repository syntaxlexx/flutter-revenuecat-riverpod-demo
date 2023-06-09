import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import 'free_screen.dart';
import 'pro_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = 'home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<HomeAction> actionsRow = [
    HomeAction(
      title: 'Track Workout',
      routeName: FreeScreen.routeName,
      color: Constants.primaryColor,
      icon: MdiIcons.weightLifter,
      vertical: true,
    ),
    HomeAction(
      title: 'Browse Workouts',
      routeName: FreeScreen.routeName,
      color: const Color(0XFF1982c4),
      icon: MdiIcons.folderTextOutline,
      vertical: true,
    )
  ];

  final List<HomeAction> actions = [
    HomeAction(
      title: 'Connect with Friends',
      routeName: FreeScreen.routeName,
      color: const Color(0XFFf44174),
      icon: MdiIcons.shareVariant,
    ),
  ];

  final List<HomeAction> proActions = [
    HomeAction(
      title: 'Add an Exercise',
      routeName: ProScreen.routeName,
      color: const Color(0XFF8ac926),
      icon: MdiIcons.plusCircle,
      requiresPro: true,
    ),
    HomeAction(
      title: 'Create a Routine',
      routeName: ProScreen.routeName,
      color: const Color(0XFFc03221),
      icon: MdiIcons.timetable,
      requiresPro: true,
    ),
    HomeAction(
      title: 'Join a Challenge',
      routeName: ProScreen.routeName,
      color: const Color(0XFF23967f),
      icon: MdiIcons.accountGroup,
      requiresPro: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final revenueCat = ref.watch(revenuecatProvider);

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.08, right: size.width * 0.05),
              child: Column(
                children: [
                  Icon(
                    Icons.person_2_sharp,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    revenueCat.isProMember ? 'PRO' : 'PRO/UPGRADE',
                    style: context.titleSmall,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/fastfit-trans.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: actionsRow
                      .map((e) => Expanded(
                            child: ActionRow(
                              action: e,
                            ),
                          ))
                      .toList(),
                ),
                Column(
                  children: actions
                      .map((e) => ActionRow(
                            action: e,
                          ))
                      .toList(),
                ),
                Column(
                  children: proActions
                      .map((e) => ActionRow(
                            action: e,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
