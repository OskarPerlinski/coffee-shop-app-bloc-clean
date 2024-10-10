import 'package:coffee_shop/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.ad,
            ),
          ),
        ),
      ),
    );
  }
}
