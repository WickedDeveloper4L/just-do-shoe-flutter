import 'package:flutter/material.dart';
import 'package:just_do_shoe/components/cartitem.dart';
import 'package:just_do_shoe/models/cart.dart';
import 'package:just_do_shoe/models/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeShoeFromCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).removeFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Cart",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      //get each shoe
                      Shoe individualShoe = value.getUserCart()[index];

                      //return cart item

                      return CartItem(
                        shoe: individualShoe,
                        onPressed: (context) =>
                            removeShoeFromCart(individualShoe),
                      );
                    },
                  ))
                ],
              ),
            ));
  }
}
