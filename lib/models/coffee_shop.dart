import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<Coffee> _shop = [
    Coffee(
      name: 'Long Black',
      price: 10.99,
      imagePath: 'assets/images/coffee/4.jpg',
    ),
    Coffee(
      name: 'Latte',
      price: 5.99,
      imagePath: 'assets/images/coffee/6.jpg',
    ),
    Coffee(
      name: 'Espresso',
      price: 4.19,
      imagePath: 'assets/images/coffee/3.jpg',
    ),
    Coffee(
      name: 'Iced Coffe',
      price: 10.99,
      imagePath: 'assets/images/coffee/7.jpg',
    ),
    Coffee(
      name: 'Cappuccino',
      price: 10.99,
      imagePath: 'assets/images/coffee/8.jpg',
    ),
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee) {
    print(coffee.name);
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItem(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
