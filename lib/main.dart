import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Button2 Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
  ];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Dropdown Button2 Demo'),
      ),
      body: Container(
        color: Colors.lime.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 5),
              const Text('Simple DropdownButton2 with no styling'),
              const SizedBox(height: 5),
              SizedBox(
                width: 200,
                child: DropdownButton2(
                  isExpanded: true,
                  hint: const Text('Select an item'),
                  value: selectedItem,
                  onChanged: (String? newSelectedItem) {
                    setState(() {
                      selectedItem = newSelectedItem;
                    });
                  },
                  items: items.map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  )).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
