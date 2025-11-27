import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_25/logic/subcription/subscription_cubit.dart';
import 'package:test_task_25/ui/home/home_screen.dart';
import 'package:test_task_25/ui/paywall/paywall_screen.dart';

import 'ui/onboarding/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionCubit, String?>(
        builder: (context, subscribed) {
          if (subscribed == null) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorSchemeSeed: Colors.deepPurple,
              useMaterial3: true,
            ),
            home: subscribed.isNotEmpty ? const HomeScreen() : const OnboardingScreen(),
            routes: {
              "/home" : (_) => const HomeScreen(),
              "/onboarding" : (_) => const OnboardingScreen(),
              "/paywall" : (_) => const PaywallScreen(),
            },
          );
        }
    );
  }
}
