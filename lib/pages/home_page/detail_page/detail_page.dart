import 'package:flutter/material.dart';
import '../../Navbar/cart_page/cart_provider.dart';
import '../data/model.dart';
import '../material/color.dart';
import '../material/spacer.dart';
import '../material/text_style.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Model model;
  const DetailsPage({Key? key, required this.model}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectIndex = 0;
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: kBackgroundColor,
        child: Column(
          children: [
            Container(
              height: height / 1.7,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: height / 10.0,
                    child: Container(
                      width: 60.0,
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.3),
                            offset: Offset(5, 5),
                            blurRadius: 10.0,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < widget.model.image.length; i++)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectIndex = i;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                child: Image.asset(widget.model.image[i]),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        widget.model.image[selectIndex],
                        width: height / 1.8,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.model.name,
                        style: heading.copyWith(
                            fontSize: 30.0, fontFamily: 'Lobster'),
                      ),
                      Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: gray,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              MaterialButton(
                                minWidth: 10,
                                onPressed: () {
                                  cart.addItem(
                                    image: widget.model.image.toList(),
                                    name: widget.model.name.toString(),
                                    price: widget.model.price.toString(),
                                  );
                                  setState(() {
                                    qty++;
                                  });
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //         shape: RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(20)),
                                  //         backgroundColor:
                                  //             Colors.indigoAccent.shade200,
                                  //         duration: Duration(seconds: 1),
                                  //         behavior: SnackBarBehavior.floating,
                                  //         content: Text(
                                  //           "Product is added to Cart",
                                  //           style: TextStyle(
                                  //               fontWeight: FontWeight.w200),
                                  //         )));
                                },
                                child: Text(
                                  '+',
                                  style: itemCardHeading.copyWith(
                                      color: lightBlack),
                                ),
                              ),
                              Text(
                                '$qty',
                                style:
                                itemCardHeading.copyWith(color: lightBlack),
                              ),
                              MaterialButton(
                                minWidth: 10,
                                onPressed: () {
                                  cart.remove(
                                    image: widget.model.image.toList(),
                                    name: widget.model.name.toString(),
                                    price: widget.model.price.toString(),
                                  );
                                  if (qty > 1)
                                    setState(() {
                                      qty--;
                                    });
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //         shape: RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(20)),
                                  //         backgroundColor:
                                  //             Colors.indigoAccent.shade200,
                                  //         duration: Duration(seconds: 1),
                                  //         behavior: SnackBarBehavior.floating,
                                  //         content: Text(
                                  //           "Product is removed from Cart",
                                  //           style: TextStyle(
                                  //               fontWeight: FontWeight.w200),
                                  //         )));
                                },
                                child: Text(
                                  '-',
                                  style: itemCardHeading.copyWith(
                                      color: lightBlack),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SpaceVH(height: 20.0),
                  Text(
                    widget.model.description,
                    style: TextStyle(
                        color: lightBlack, fontSize: 20, fontFamily: 'Rancho'),
                  ),
                  SpaceVH(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Total Price\n',
                            style: subHeading,
                          ),
                          TextSpan(
                            text: widget.model.price.toString(),
                            style: itemCardHeading,
                          ),
                        ]),
                      ),
                      Container(
                        height: 40.0,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            cart.addItem(
                              image: widget.model.image.toList(),
                              name: widget.model.name.toString(),
                              price: widget.model.price.toString(),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.indigoAccent.shade200,
                                duration: Duration(seconds: 1),
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  "Product is added to Cart",
                                  style: TextStyle(fontWeight: FontWeight.w200),
                                )));
                          },
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: itemCardHeading.copyWith(color: white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}