// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeCoffee(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItem(coffee);
  }

  void payNow() {
    // print
    print('Stripe Pay Now');
  }

  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<CoffeeShop>(context).userCart;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              'Your Cart',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: carts.length,
                itemBuilder: (context, index) {
                  // get individual coffee
                  Coffee coffee = carts[index];
                  return CoffeTile(
                    coffee: coffee,
                    onPress: () => removeCoffee(coffee),
                    icon: Icons.delete,
                  );
                },
              ),
            ),
            if (carts.length > 0)
              GestureDetector(
                  onTap: payNow,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Pay Now',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
