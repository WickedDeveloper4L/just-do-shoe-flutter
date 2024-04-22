// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:just_do_shoe/models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  void Function(BuildContext)? onPressed;
  CartItem({super.key, required this.shoe, required this.onPressed});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Slidable(
          endActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              onPressed: widget.onPressed,
              backgroundColor: Colors.red.shade900,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(10),
            )
          ]),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Image.asset(
                widget.shoe.imagePath,
                width: 75,
              ),
              title: Text(
                widget.shoe.name,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              subtitle: Text("\$${widget.shoe.price}"),
            ),
          ),
        ));
  }
}
