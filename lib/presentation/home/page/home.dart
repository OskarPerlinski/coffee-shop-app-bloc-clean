import 'package:coffee_shop/presentation/home/widgets/advertisement.dart';
import 'package:coffee_shop/presentation/home/widgets/cappuccino.dart';
import 'package:coffee_shop/presentation/home/widgets/header.dart';
import 'package:coffee_shop/presentation/home/widgets/latte.dart';
import 'package:coffee_shop/presentation/home/widgets/macchiato.dart';
import 'package:coffee_shop/presentation/home/widgets/mocha.dart';
import 'package:coffee_shop/presentation/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Header(),
              SizedBox(height: 20),
              SearchField(),
              Advertisement(),
              Cappuccino(),
              SizedBox(height: 15),
              Macchiato(),
              SizedBox(height: 15),
              Latte(),
              SizedBox(height: 15),
              Mocha()
            ],
          ),
        ),
      ),
    );
  }
}
