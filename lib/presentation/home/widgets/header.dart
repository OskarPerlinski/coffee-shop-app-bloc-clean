import 'package:coffee_shop/common/helper/navigator/app_navigator.dart';
import 'package:coffee_shop/presentation/cart/pages/cart.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: Colors.brown,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 60,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _menu(),
            _homeText(),
            _profile(context),
          ],
        ),
      ),
    );
  }

  Widget _homeText() {
    return const Column(
      children: [
        Text(
          'Kopi Kap',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _menu() {
    return const Icon(
      Icons.menu,
      color: Colors.white,
    );
  }

  Widget _profile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context,
          const CartPage(),
        );
      },
      child: const Icon(
        Icons.shopping_bag_outlined,
        color: Colors.white,
      ),
    );
  }
}
