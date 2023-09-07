import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';


class CustomDropdownSearchWidget extends StatefulWidget {
  const CustomDropdownSearchWidget({super.key});

  @override
  _CustomDropdownSearchWidgetState createState() =>
      _CustomDropdownSearchWidgetState();
}

class CustomItem {
  final int id;
  final String name;

  CustomItem(this.id, this.name);
}

class _CustomDropdownSearchWidgetState extends State<CustomDropdownSearchWidget> {
  List<CustomItem>? _selectedItem = [];

  // Replace this with your actual list of custom items.
  final List<CustomItem> _items = [
    CustomItem(1, 'Item 1'),
    CustomItem(2, 'Item 2'),
    CustomItem(3, 'Item 3'),
    // Add more items as needed.
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<CustomItem>.multiSelection(
      selectedItems: _selectedItem!,
      items: _items,
      itemAsString: (CustomItem item) => item.name,
      onChanged: (item) {
        for(CustomItem i in item){
          print("${i.id} ::: ${i.name}");
        }
        setState(() {
          _selectedItem = item;
        });
      },
      popupProps: const PopupPropsMultiSelection.menu(
        showSelectedItems: true,
        showSearchBox: true,
      ),
      compareFn: (item, sItem) => item.id == sItem.id,
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: "Select an item",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text('Custom Dropdown Search'),
    ),
    body: const Padding(
      padding: EdgeInsets.all(20.0),
      child: CustomDropdownSearchWidget(),
    ),
  ),
));
