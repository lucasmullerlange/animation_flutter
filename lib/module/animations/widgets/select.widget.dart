import 'package:flutter/material.dart';

class SelectItem {
  String value;
  String label;

  SelectItem({required this.value, required this.label});
}

class SelectWidget extends StatefulWidget {
  String selected;
  List<SelectItem> items;
  void Function(String) onChange;

  SelectWidget({
    Key? key,
    required this.items,
    required this.onChange,
    required this.selected,
  }) : super(key: key);

  @override
  State<SelectWidget> createState() => _SelectWidgetState(
        items: items,
        selected: selected,
        onChange: onChange,
      );
}

class _SelectWidgetState extends State<SelectWidget> {
  List<SelectItem> items;
  String selected;
  void Function(String) onChange;

  _SelectWidgetState({
    required this.items,
    required this.onChange,
    required this.selected,
  }) : super();

  handleChanged(String? value) {
    setState(() => selected = value ?? "");
    onChange(value!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        iconSize: 42,
        value: selected,
        isExpanded: true,
        onChanged: handleChanged,
        icon: const Icon(Icons.arrow_drop_down),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        items: items.map<DropdownMenuItem<String>>((SelectItem item) {
          return DropdownMenuItem<String>(
            value: item.value,
            child: Text(
              item.label,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      ),
    );
  }
}
