import 'package:flutter_state_managements/state/my_home_state.dart';
import 'package:state_notifier/state_notifier.dart';

class MyHomePageStateNotifier extends StateNotifier<MyHomePageState> {
  MyHomePageStateNotifier() : super(const MyHomePageState());

  void increment() {
    state = state.copyWith(state.counter + 1);
  }

  void reBuild() {
    state = const MyHomePageState();
  }
}
