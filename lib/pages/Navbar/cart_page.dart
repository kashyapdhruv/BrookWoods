import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_page/cart_items.dart';
import 'cart_page/cart_provider.dart';


class CartProduct extends StatelessWidget {
  static const id = '/CartScreen';
  const CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(CupertinoIcons.cart_badge_plus,
            size: 30,),
          )
        ],
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          // Card(
          //   margin: const EdgeInsets.all(20),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text('Total'),
          //         Spacer(),
          //         Chip(label: Text("${cart.totalToPay.toString()}")),
          //         TextButton(onPressed: () {}, child: Text("Order Now"))
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 645,
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) => CartItemTile(
                  image: cart.items.values.toList()[index].image,
                  name: cart.items.values.toList()[index].name,
                  price: cart.items.values.toList()[index].price,
                  qty: cart.items.values.toList()[index].qty,
                )),
          ),
        ],
      ),
    );
  }
}