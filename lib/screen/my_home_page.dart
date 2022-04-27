import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_state_managements/state/my_home_state.dart';
import 'package:flutter_state_managements/view_model/my_home_view_model.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    print('MyHomePageをビルド');
    return StateNotifierProvider<MyHomePageStateNotifier, MyHomePageState>(
      create: (context) => MyHomePageStateNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              WidgetA(),
              WidgetB(),
              WidgetC(),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WidgetAをビルド');
    return const Text('You have pushed the button this many times:');
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('WidgetBをビルド');
    final int counter = context.watch<MyHomePageState>().counter;
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VoidCallback increment =
        context.read<MyHomePageStateNotifier>().increment;
    print('WidgetCをビルド');
    return ElevatedButton(
      onPressed: increment,
      child: const Text('カウント'),
    );
  }
}
