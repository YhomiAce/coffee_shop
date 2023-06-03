// ignore_for_file: prefer_const_constructors

import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeTile extends StatelessWidget {
  final Coffee coffee;
  final Function()? onPress;
  final IconData icon;
  const CoffeTile({
    super.key,
    required this.coffee,
    required this.onPress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text(coffee.price.toString()),
        leading: Image.asset(
          coffee.imagePath,
        ),
        trailing: IconButton(
          icon: Icon(
            icon,
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}
