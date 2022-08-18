import 'dart:convert';
import 'package:flutter/material.dart';
import '../../models/catalog.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
    await rootBundle.loadString("assets/json/atta_and_flours.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    print(productsData);
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueAccent.shade400,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      // body: FutureBuilder(
      //   future: ReadJsonData(),
      //   builder: (context,data){
      //     if(data.hasError){
      //       return Center(child: Text('${data.error}'));
      //     }
      //     else if (data.hasData){
      //
      //       var items = data.data as List<Product>;
      //       return ListView.builder(
      //           itemBuilder: (context, index){
      //             return Card(
      //               elevation: 3,
      //               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      //               child: Container(
      //                 padding: EdgeInsets.all(8),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     Container(
      //                       child: Image(image: AssetImage(items[index].image.toString()),
      //                       fit: BoxFit.fill,),
      //                     ),
      //                     Expanded(
      //                       child: Container(
      //                         padding: EdgeInsets.only(bottom: 8),
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Padding(padding: EdgeInsets.only(left: 8, right: 8),
      //                             child: Text(items[index].name.toString(),
      //                               style: TextStyle(
      //                                 fontSize: 16,
      //                                 fontWeight: FontWeight.bold
      //                               ),
      //                             ),),
      //                             Padding(padding: EdgeInsets.only(left: 8, right: 8),
      //                             child: Text(items[index].price.toString()),)
      //                           ],
      //                         ),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             );
      //           });
      //     }else{
      //       return Center(child: CircularProgressIndicator(),);
      //     }
      //   },
      // ),
    );
  }

  // Future<List<Product>?> ReadJsonData() async{
  //
  //   final jsondata = await rootBundle.rootBundle.loadString('assets/json/atta_and_flours.json');
  //   final list = json.decode(jsondata) as List<dynamic>;
  //
  //
  //   return list.map((e) => Product.fromJson(e)).toList();
  //
  // }
}

