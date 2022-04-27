import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    print('MyHomePageをビルド');
    return ChangeNotifierProvider(
      create: (context) => MyHomePageState(),
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

class MyHomePageState extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void reBuild() {
    notifyListeners();
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
    // final int counter = context.watch<MyHomePageState>().counter;

    // 特定の状態だけを監視する
    final int counter =
        context.select<MyHomePageState, int>((state) => state.counter);
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
    final VoidCallback increment = context.read<MyHomePageState>().increment;
    print('WidgetCをビルド');
    return ElevatedButton(
      onPressed: increment,
      child: const Text('カウント'),
    );
  }
}
