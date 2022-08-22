import 'package:catalog_app/pages/home_page/material/color.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: kBlueColor,
          ),
          child: Card(
            margin: EdgeInsets.only(right: 15),
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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
                            width: 140.0,
                            child: Image.asset(model.image[0],
                            fit: BoxFit.cover,),
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
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 28,
                                      fontFamily: 'Lobster'
                                    ),
                                  ),
                                  SpaceVH(height: 10.0),
                                  Text(
                                    model.description,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: lightBlack,
                                      fontSize: 16,
                                      fontFamily: 'Rancho'
                                    ),
                                  ),
                                  SpaceVH(height: 30.0),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 18,vertical: 5),
                                      decoration: BoxDecoration(
                                        color: kSecondaryColor.withOpacity(0.8),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.elliptical(25, 20),
                                            topLeft: Radius.elliptical(25, 20),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)
                                        )
                                      ),
                                      child: Text(
                                        model.price,
                                        style: itemCardPrice,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ]))),
          ),
        ),
      );
  }
}