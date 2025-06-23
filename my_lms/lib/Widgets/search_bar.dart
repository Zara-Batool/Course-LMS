import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29.5),
        border: Border.all(
          color: _isFocused ? const Color.fromARGB(255, 1, 7, 12) : Colors.grey,
        ),
      ),
      child: TextField(
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(
            color:
                _isFocused ? const Color.fromARGB(255, 1, 8, 14) : Colors.black,
          ),
          icon: Icon(
            Icons.search,
            color:
                _isFocused ? const Color.fromARGB(255, 1, 7, 12) : Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
