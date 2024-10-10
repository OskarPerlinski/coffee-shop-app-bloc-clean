import 'package:coffee_shop/common/widgets/button/basic_button.dart';
import 'package:flutter/material.dart';

class OrderToTable extends StatelessWidget {
  const OrderToTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 20,
      ),
      child: BasicAppButton(
        onPressed: () {},
        title: 'Order to your table',
      ),
    );
  }
}
