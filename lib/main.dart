
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_25/app.dart';
import 'package:test_task_25/logic/subcription/subscription_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final subscriptionCubit = SubscriptionCubit();
  await subscriptionCubit.load();

  runApp(
    BlocProvider.value(value: subscriptionCubit, child: MyApp(),),
  );
}