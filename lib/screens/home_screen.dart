import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/home_action.dart';
import '../utils/constants.dart';
import '../utils/text_extensions.dart';
import '../widgets/action_row.dart';
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
    const HomeAction(
      title: 'Track Workout',
      routeName: FreeScreen.routeName,
      color: Constants.primaryColor,
      icon: Icons.fitness_center,
      vertical: true,
    ),
    const HomeAction(
      title: 'Browse Workouts',
      routeName: FreeScreen.routeName,
      color: Color(0XFF1982c4),
      icon: Icons.library_books,
      vertical: true,
    )
  ];

  final List<HomeAction> actions = [
    const HomeAction(
      title: 'Connect with Friends',
      routeName: FreeScreen.routeName,
      color: Color(0XFFf44174),
      icon: Icons.share,
    ),
  ];

  final List<HomeAction> proActions = [
    const HomeAction(
      title: 'Add an Exercise',
      routeName: ProScreen.routeName,
      color: Color(0XFF8ac926),
      icon: Icons.add_circle,
      requiresPro: true,
    ),
    const HomeAction(
      title: 'Create a Routine',
      routeName: ProScreen.routeName,
      color: Color(0XFFc03221),
      icon: Icons.timer_10,
      requiresPro: true,
    ),
    const HomeAction(
      title: 'Join a Challenge',
      routeName: ProScreen.routeName,
      color: Color(0XFF23967f),
      icon: Icons.sports_gymnastics,
      requiresPro: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    'PRO/UPGRADE',
                    style: context.titleSmall,
                  ),
                ],
              ),
            ),
          ),
          Column(
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
        ],
      ),
    );
  }
}
