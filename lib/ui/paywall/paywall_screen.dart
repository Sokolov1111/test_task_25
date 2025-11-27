import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_25/logic/paywall/paywall_cubit.dart';
import 'package:test_task_25/logic/subcription/subscription_cubit.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PaywallCubit(),
      child: BlocBuilder<PaywallCubit, bool>(
          builder: (context, yearly) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Подписка"),
              ),
              body: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text(
                      "Выберите подписку",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12,),

                    SubscriptionOptionCard(
                        title: '1 месяц',
                        subtitle: 'Обычная',
                        price: '1000 руб.',
                        selected: !yearly,
                        onTap: () => context.read<PaywallCubit>().selectMonthly(),
                    ),
                    const SizedBox(height: 12,),

                    SubscriptionOptionCard(
                      title: '12 месяцев',
                      subtitle: 'Скидка',
                      price: '10000 руб.',
                      selected: yearly,
                      onTap: () => context.read<PaywallCubit>().selectYearly(),
                    ),

                    const Spacer(),

                    FilledButton(
                        onPressed: () {
                          context.read<SubscriptionCubit>().subscribe(
                            yearly ? "Годовая" : "Месячная"
                          );
                          Navigator.pushReplacementNamed(context, "/home");
                        },
                        child: const Text("Продолжить"),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

class SubscriptionOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final bool selected;
  final VoidCallback onTap;

  const SubscriptionOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color accent = Colors.deepPurple;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: selected ? accent.withOpacity(0.10) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: selected ? accent : Colors.grey.shade300,
          width: selected ? 2.2 : 1.2,
        ),
        boxShadow: [
          if (selected)
            BoxShadow(
              color: accent.withOpacity(0.25),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Левая часть: текст
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: selected ? accent : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: selected
                            ? accent.withOpacity(0.8)
                            : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              // Правая часть: цена
              Text(
                price,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: selected ? accent : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}