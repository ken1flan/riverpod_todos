import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          const Title(),
          const TextField(
            decoration: InputDecoration(
              labelText: 'What needs to be done?',
            ),
          ),
          const SizedBox(height: 42),
          const Toolbar(),
          for (var i = 0; i < 3; i++) ...[
            if (i > 0) const Divider(height: 0),
            const TodoItem(),
          ],
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'todos',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(38, 47, 47, 247),
        fontSize: 100,
        fontWeight: FontWeight.w100,
        fontFamily: 'Helvetica Neue',
      ),
    );
  }
}

class Toolbar extends StatelessWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Expanded(
        child: Text(
          '0 items left',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Tooltip(
        message: 'All todos',
        child: TextButton(
          style: const ButtonStyle(
            visualDensity: VisualDensity.compact,
          ),
          onPressed: () {
            doNothing();
          },
          child: const Text('All'),
        ),
      ),
      Tooltip(
        message: 'Only uncompleted todos',
        child: TextButton(
          style: const ButtonStyle(
            visualDensity: VisualDensity.compact,
          ),
          onPressed: () {
            doNothing();
          },
          child: const Text('Active'),
        ),
      ),
      Tooltip(
        message: 'Only completed todos',
        child: TextButton(
          style: const ButtonStyle(
            visualDensity: VisualDensity.compact,
          ),
          onPressed: () {
            doNothing();
          },
          child: const Text('Completed'),
        ),
      ),
    ]);
  }

  doNothing() {}
}

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: false,
        onChanged: (bool? value) {
          doNothing();
        },
      ),
      title: const Text('やること'),
    );
  }

  void doNothing() {
    //
  }
}
