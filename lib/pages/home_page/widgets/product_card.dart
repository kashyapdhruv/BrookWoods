import 'package:flutter/material.dart';
import '../data/model.dart';
import '../detail_page/detail_page.dart';
import '../material/spacer.dart';
import '../material/text_style.dart';

class ItemCard extends StatelessWidget {
  final Model model;
  const ItemCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(80, 50),
            bottomRight: Radius.elliptical(80, 50),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
      ),
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => DetailsPage(model: model)));
          },
          child: Container(
              height: 140.0,
              margin: EdgeInsets.only(bottom: 30.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150.0,
                      child: Image.asset(model.image[0]),
                    ),
                    Container(
                        width: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpaceVH(
                              height: 10,
                            ),
                            Text(
                              model.name,
                              style: itemCardHeading,
                            ),
                            SpaceVH(height: 10.0),
                            Text(
                              model.description,
                              maxLines: 2,
                              style: itemCardDes,
                            ),
                            SpaceVH(height: 30.0),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                model.price,
                                style: itemCardPrice,
                              ),
                            )
                          ],
                        )),
                  ]))),
    );
  }
}