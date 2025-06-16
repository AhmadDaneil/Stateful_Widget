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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible List'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item), 
            direction: DismissDirection.endToStart,
            dismissThresholds: const{
              DismissDirection.startToEnd: 0.5,
              DismissDirection.endToStart: 0.5,
            },
            onDismissed: (direction) {
              final removedItem = items[index];
              final removedIndex = index;
            setState(() {
              items.removeAt(index);
            });
            ScaffoldMessenger.of(context,).showSnackBar(SnackBar(
                content: Text('$item dismissed'),
                backgroundColor: Colors.blue,
                action: SnackBarAction(label: 'UNDO', onPressed: (){
                  setState(() {
                    items.insert(removedIndex, removedItem);
                  });
                },
                ),
                  behavior: SnackBarBehavior.floating,
                )
                );
            },
            background: Container(color:Colors.red),
            child:ListTile(title:Text(item)),
          );
                },
                
      ),
                
          );
        }
  }