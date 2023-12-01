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
  final List<String> items2 = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
    'Item9',
    'Item10',
  ];
  String? selectedItem2;
  List<String> selectedItems = [];

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
              const SizedBox(height: 10),
              const Text('Simple DropdownButton2 with no styling'),
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
                  items: items
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Simple DropdownButton2 with styling'),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: const Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  value: selectedItem2,
                  onChanged: (String? newSelectedItem) {
                    setState(() {
                      selectedItem2 = newSelectedItem;
                    });
                  },
                  items: items2
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ))
                      .toList(),
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 170,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.indigo,
                      ),
                      color: Colors.blueAccent,
                    ),
                    elevation: 3,
                  ),
                  iconStyleData: const IconStyleData(
                    openMenuIcon: Icon(Icons.keyboard_arrow_down),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                    ),
                    iconSize: 15,
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.lightBlueAccent,
                    ),
                    offset: const Offset(-20, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('DropdownButton2 items separated by dividers'),
              const SizedBox(height: 10),
              DropdownButton2(
                hint: const Text('Select an item'),
                value: selectedItem,
                onChanged: (String? newSelectedItem) {
                  setState(() {
                    selectedItem = newSelectedItem;
                  });
                },
                items: items
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item),
                      if (item != items.last) const Divider()
                    ],
                  ),
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
