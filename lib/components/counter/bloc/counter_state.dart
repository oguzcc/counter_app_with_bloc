part of 'counter_bloc.dart';

class CounterState {
  final int counterValue;

  CounterState({required this.counterValue});

  CounterState copyWith({required int counterValue}) => CounterState(
        counterValue: counterValue,
      );
}
