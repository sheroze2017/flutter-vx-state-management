import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practise1/core/store.dart';
import 'package:practise1/models/cart.dart';
import 'package:practise1/util/route.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:practise1/models/catalog.dart';

import 'catalogList.dart';
import 'home_widgets/catalog_header.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String a = " A253";
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // getting data from json to flutter home page
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodeData =
        jsonDecode(catalogJson); // convert the json data into data on screen
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext, Object, VxStatus) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.canvasColor,
          child: Icon(CupertinoIcons.cart),
        ).badge(color: Vx.red500, size: 20, count: _cart.items.length),
      ),
      // appBar: AppBar(
      //   // backgroundColor: Colors.white,
      //   // elevation: 0.0, // for finish shadow
      //   // iconTheme: IconThemeData(color: Colors.black),
      //   title: Text(
      //     "Catalog App",
      //     // style: TextStyle(color: Colors.grey),
      //   ),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: (CatalogModel.items.isNotEmpty)
      //       ? GridView.builder(
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             mainAxisSpacing: 15,
      //             crossAxisSpacing: 15,
      //           ),
      //           itemBuilder: (context, index) {
      //             final item = CatalogModel.items[index];
      //             return Card(
      //                 clipBehavior: Clip.antiAlias,
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(10)),
      //                 child: GridTile(
      //                   header: Container(
      //                     child: Text(
      //                       item.name,
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     width: 100,
      //                     padding: const EdgeInsets.all(12),
      //                     decoration: BoxDecoration(color: Colors.blueGrey),
      //                   ),
      //                   child: Image.network(item.image),
      //                   footer: Container(
      //                     child: Text(
      //                       item.price.toString(),
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     width: 100,
      //                     padding: const EdgeInsets.all(12),
      //                     decoration: BoxDecoration(color: Colors.cyan),
      //                   ),
      //                 ));
      //           },
      //           itemCount: CatalogModel.items.length,
      //         )
      //       : Center(child: CircularProgressIndicator()),
      // ),
      // drawer: MyDrawer(),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                catalogList().py16().expand()
              else
                Center(
                  child: CircularProgressIndicator().centered().expand(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
