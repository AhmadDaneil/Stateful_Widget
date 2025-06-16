import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stateful Widget',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Box'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            showDialog(context: context, builder: (context) => AlertDialog(
              title: const Text('Warning'),
              content: const Text('Watch out your click! Are you sure to proceed?'),
              actions: [
                ElevatedButton(onPressed: (){}, child: const Text('CANCEL')
                ),
                ElevatedButton(onPressed: (){
                }, child: const Text('PROCEED'))
              ],
            ),
            );
          },
          child: const Text('Click Me If You Dare!'),
          ),
          ),
    );
    
}
}
