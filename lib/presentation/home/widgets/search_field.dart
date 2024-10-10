import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.all(12),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: 'Search Coffee',
          hintStyle: const TextStyle(
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}
