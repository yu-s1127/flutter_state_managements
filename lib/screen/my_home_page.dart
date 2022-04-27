import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_managements/main.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('MyHomePageをビルド');
    return ProviderScope(
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

class WidgetB extends ConsumerWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('WidgetBをビルド');
    final int counter = ref.watch(myHomePageProvider).counter;
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends ConsumerWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoidCallback increment =
        ref.read(myHomePageProvider.notifier).increment;
    print('WidgetCをビルド');
    return ElevatedButton(
      onPressed: increment,
      child: const Text('カウント'),
    );
  }
}
