import 'package:flutter/material.dart';
import 'package:just_do_shoe/models/shoe.dart';

class Cart extends ChangeNotifier {
  //List of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        description: "Super comfy and lit.",
        name: "Nike Airmax",
        imagePath: 'lib/images/Airmax.png',
        price: "150"),
    Shoe(
        description: "Limited edition from MJ.",
        name: "Air Jordan",
        imagePath: 'lib/images/jordan.png',
        price: "150"),
    Shoe(
        description: "Super comfy and lit.",
        name: "Nike Low Dunk",
        imagePath: 'lib/images/nike_low_dunk.png',
        price: "230"),
    Shoe(
        description: "Super comfy and lit.",
        name: "Nike Rihanna",
        imagePath: 'lib/images/Nike_runing.png',
        price: "150"),
  ];
  //list of items in users cart
  List<Shoe> userCart = [];

  //get list of items for sale

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get list of items in users cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //method to add items to cart
  void addToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //method to remove user items from cart
  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
