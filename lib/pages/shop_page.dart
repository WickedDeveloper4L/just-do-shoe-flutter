import 'package:flutter/material.dart';
import 'package:just_do_shoe/components/shoe_tile.dart';
import 'package:just_do_shoe/models/cart.dart';
import 'package:just_do_shoe/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);

    //alert user
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Center(
                child: Text(
                  "Successfully added!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              content: Text("Check your cart."),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  //search
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 22),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  //message
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      "Everyone flies, some fly longer than others.",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ),
                  //hot picks
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Hot picks🔥",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "see all",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(right: 25),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            Shoe shoe = value.getShoeList()[index];
                            return ShoeTile(
                              shoe: shoe,
                              onTap: () => addShoeToCart(shoe),
                            );
                          })),
                  const Padding(
                    padding: EdgeInsets.only(top: 50, left: 25, right: 25),
                    child: Divider(
                        // color: Colors.white,
                        ),
                  )
                ],
              ),
            ));
  }
}
