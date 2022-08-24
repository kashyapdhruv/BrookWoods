import 'package:catalog_app/pages/home_page/material/color.dart';
import 'package:catalog_app/pages/home_page/widgets/product_card.dart';
import 'package:catalog_app/pages/home_page/widgets/show_all_widget.dart';
import 'package:flutter/material.dart';
import 'data/home_data.dart';
import 'data/model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      bottom: TabBar(
        tabs: [
          Tab(
            text: "Sofas & Rec",
          ),
          Tab(
            text: "Seating",
          ),
          Tab(
            text: 'Chairs',
          ),
          Tab(
            text: "Beds",
          ),
          Tab(
            text: "Tables",
          ),
          Tab(
            text: "Kids & Teens",
          ),
          Tab(
            text: "Outdoor",
          ),
          Tab(
            text: "Bar.Fur",
          ),
        ],
        unselectedLabelStyle: TextStyle(fontSize: 15,
        fontFamily: 'Pacifico',
        fontWeight: FontWeight.bold),
        labelPadding: EdgeInsets.symmetric(horizontal: 25),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        isScrollable: true,
        indicator: BoxDecoration(
            color: Colors.grey.shade400.withOpacity(0.4),
            borderRadius: BorderRadius.circular(25)),
        labelStyle: TextStyle(fontSize: 20,
            fontFamily: 'Pacifico'),
      ),
      toolbarHeight: 130,
      title: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 05),
            child: Text(
              "BrookWoods",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.grey.shade200,
                fontFamily: 'Rye'
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 05),
            child: Text(
              "....decorate your Life with Arts",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Courgette',
                  color: kBlueColor,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<Models>(context);
    final sofarec = productData.sofarec;
    final Seating = productData.Seating;
    final Chairs = productData.Chairs;
    final Tables = productData.Tables;
    final Beds = productData.Beds;
    final kids = productData.kids;
    final Outdoor = productData.Outdoor;
    final bar = productData.bar;


    return DefaultTabController(
      length: 8,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: buildAppbar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )
            ),
            child: TabBarView(children: [
              ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: BouncingScrollPhysics(),
                children: [
                  ShowAllWidget(leftText: 'Sofas and Recliners'),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        itemCount: sofarec.length,
                        itemBuilder: (context, index) {
                          var data = sofarec[index];
                          return ItemCard(
                              model: Model(
                                  name: data.name,
                                  price: data.price,
                                  description: data.description,
                                  image: data.image));
                        },
                        shrinkWrap: true,
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                      )),
                ],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: BouncingScrollPhysics(),
                children: [
                  ShowAllWidget(leftText: 'Seating'),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        itemCount: Seating.length,
                        itemBuilder: (context, index) {
                          var data = Seating[index];
                          return ItemCard(
                              model: Model(
                                  name: data.name,
                                  price: data.price,
                                  description: data.description,
                                  image: data.image));
                        },
                        shrinkWrap: true,
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                      )),
                ],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: BouncingScrollPhysics(),
                children: [
                  ShowAllWidget(leftText: 'Chairs'),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        itemCount: Chairs.length,
                        itemBuilder: (context, index) {
                          var data = Chairs[index];
                          return ItemCard(
                              model: Model(
                                  name: data.name,
                                  price: data.price,
                                  description: data.description,
                                  image: data.image));
                        },
                        shrinkWrap: true,
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                      )),
                ],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: BouncingScrollPhysics(),
                children: [
                  ShowAllWidget(leftText: 'Beds'),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        itemCount: Beds.length,
                        itemBuilder: (context, index) {
                          var data = Beds[index];
                          return ItemCard(
                              model: Model(
                                  name: data.name,
                                  price: data.price,
                                  description: data.description,
                                  image: data.image));
                        },
                        shrinkWrap: true,
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                      )),
                ],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: BouncingScrollPhysics(),
                children: [
                  ShowAllWidget(leftText: 'Tables'),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        itemCount: Tables.length,
                        itemBuilder: (context, index) {
                          var data = Tables[index];
                          return ItemCard(
                              model: Model(
                                  name: data.name,
                                  price: data.price,
                                  description: data.description,
                                  image: data.image));
                        },
                        shrinkWrap: true,
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                      )),
                ],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: BouncingScrollPhysics(),
                children: [
                  ShowAllWidget(leftText: 'Kids and Teens'),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        itemCount: kids.length,
                        itemBuilder: (context, index) {
                          var data = kids[index];
                          return ItemCard(
                              model: Model(
                                  name: data.name,
                                  price: data.price,
                                  description: data.description,
                                  image: data.image));
                        },
                        shrinkWrap: true,
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                      )),
                ],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: BouncingScrollPhysics(),
                children: [
                  ShowAllWidget(leftText: 'Outdoor'),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        itemCount: Outdoor.length,
                        itemBuilder: (context, index) {
                          var data = Outdoor[index];
                          return ItemCard(
                              model: Model(
                                  name: data.name,
                                  price: data.price,
                                  description: data.description,
                                  image: data.image));
                        },
                        shrinkWrap: true,
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                      )),
                ],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: BouncingScrollPhysics(),
                children: [
                  ShowAllWidget(leftText: 'Bar Furniture'),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        itemCount: bar.length,
                        itemBuilder: (context, index) {
                          var data = bar[index];
                          return ItemCard(
                              model: Model(
                                  name: data.name,
                                  price: data.price,
                                  description: data.description,
                                  image: data.image));
                        },
                        shrinkWrap: true,
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                      )),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

