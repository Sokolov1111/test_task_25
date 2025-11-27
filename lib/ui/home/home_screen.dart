import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_25/logic/subcription/subscription_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plan = context.watch<SubscriptionCubit>().state ?? "Нет данных";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Главный экран"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ваша подписка: $plan", style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 20,),
                  Text("Контент", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 12,),

                  ...List.generate(
                      4,
                      (i) => Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Text(
                            "title",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "subtitle",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      )
                  ),

                  FilledButton(
                      onPressed: () {
                        context.read<SubscriptionCubit>().reset();
                        Navigator.pushReplacementNamed(context, "/paywall");
                      },
                      child: const Text("Сбросить подписку"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
