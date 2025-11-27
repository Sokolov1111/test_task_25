
import 'package:flutter_bloc/flutter_bloc.dart';

class PaywallCubit extends Cubit<bool> {
  PaywallCubit() : super(true);

  void selectYearly() => emit(true);
  void selectMonthly() => emit(false);
}