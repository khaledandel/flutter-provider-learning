import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_provider/counter_contorller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => CounterConterllar(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Selector<CounterConterllar, String?>(
              selector: (BuildContext context, controllar) {
                return controllar.userName;
              },
              builder: (BuildContext context, valueAsUserName, Widget? child) {
                return Text(
                  valueAsUserName ?? '',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(controller: controller),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                context.read<CounterConterllar>().setUserName(controller.text);
              },
              child: Text('Submit user name'),
            ),

            SizedBox(height: 40),
            Selector<CounterConterllar, int>(
              selector: (BuildContext context, contrllar) {
                return contrllar.counter;
              },
              builder: (BuildContext context, valueAsCounter, Widget? child) {
                return Text(
                  valueAsCounter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterConterllar>().incrementConter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
