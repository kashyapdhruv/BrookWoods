import 'package:catalog_app/pages/home_page/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'data/home_data.dart';
import 'data/model.dart';
import 'material/text_style.dart';

class HomePage extends StatelessWidget {
  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      bottom: TabBar(
        tabs: [
          Tab(
            text: "Sofa",
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
            text: "Outdoor",
          ),
          Tab(
            text: "Bar.F",
          ),
          Tab(
            text: "Kids",
          ),


        ],
        labelPadding: EdgeInsets.symmetric(horizontal: 25),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        isScrollable: true,
        indicator: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(25)),
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      toolbarHeight: 110,
      title: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 05),
            child: Text(
              "BrookWoods",
              style: heading,
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
              "Decorate your Life with Arts",
              style: subHeading,
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: buildAppbar(),
        body: TabBarView(children: [
          ListView(
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: BouncingScrollPhysics(),
            children: [
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
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: BouncingScrollPhysics(),
            children: [
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
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: BouncingScrollPhysics(),
            children: [
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
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: BouncingScrollPhysics(),
            children: [
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
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: BouncingScrollPhysics(),
            children: [
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
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: BouncingScrollPhysics(),
            children: [
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
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: BouncingScrollPhysics(),
            children: [
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
          ListView(
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: BouncingScrollPhysics(),
            children: [
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
        ]),
      ),
    );
  }
}