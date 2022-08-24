import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart_provider.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile(
      {Key? key,
        required this.image,
        required this.name,
        required this.price,
        required this.qty})
      : super(key: key);

  final List image;
  final String name;
  final String price;
  final int qty;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: Image.asset(
                    image[0],
                    alignment: Alignment(-3, 0),
                  ),
                ),
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Text(name.toString()),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        price.toString(),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "x${qty.toString()}",
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(),
                      // Text('${price * qty}'),

                      SizedBox(
                        width: 10,
                        height: 8,
                      ),
                      IconButton(
                          icon: Icon(CupertinoIcons.trash_fill),
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .removeItem(name);
                          }),
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 27),
                       child: Row(
                         children: [
                           IconButton(
                               icon: Icon(CupertinoIcons.add_circled),
                               onPressed: () {
                                 cart.addItem(
                                   image: image.toList(),
                                   name: name.toString(),
                                   price: price.toString(),
                                 );
                               }
                           ),
                           IconButton(
                               icon: Icon(CupertinoIcons.minus_circle),
                               onPressed: () {
                                 cart.remove(
                                   image: image.toList(),
                                   name: name.toString(),
                                   price: price.toString(),
                                 );
                               }
                           )
                         ],
                       ),
                     )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}