import 'package:go_router/go_router.dart';

import 'screens/free_screen.dart';
import 'screens/home_screen.dart';
import 'screens/paywall_screen.dart';
import 'screens/pro_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/paywall',
      name: PaywallScreen.routeName,
      builder: (context, state) => const PaywallScreen(),
    ),
    GoRoute(
      path: '/free',
      name: FreeScreen.routeName,
      builder: (context, state) => const FreeScreen(),
    ),
    GoRoute(
      path: '/pro',
      name: ProScreen.routeName,
      builder: (context, state) => const ProScreen(),
    ),
  ],
);
