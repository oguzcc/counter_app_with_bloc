import 'bloc/counter_bloc.dart';
import '../../core/constants/paddings.dart';
import '../../core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // control counterCubitValue is positive
    final isPositive = context.select(
        (CounterBloc counterBloc) => counterBloc.state.counterValue > 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.counterPageTitle),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) => Text(
                '${state.counterValue}',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Padding(
            padding: Paddings.paddingBottom96,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    isPositive
                        ? context.read<CounterBloc>().add(DecrementEvent())
                        : null;
                  },
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(ResetEvent());
                  },
                  child: const Icon(Icons.restore),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
