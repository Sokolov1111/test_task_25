
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_25/services/subscription_service.dart';

class SubscriptionCubit extends Cubit<String?> {
  SubscriptionCubit() : super(null);

  final _service = SubscriptionService();

  Future<void> load() async {
    emit(await _service.load() ?? "");
  }

  Future<void> subscribe(String plan) async {
    await _service.save(plan);
    emit(plan);
  }

  Future<void> reset() async {
    await _service.reset();
    emit("reset");
  }
}