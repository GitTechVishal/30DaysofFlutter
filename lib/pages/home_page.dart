import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/modals/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int days = 30;

  String name = "Flutter Learn";
  @override
  void initState() {
    super.initState();
    loaddata();
    setState(() {});
  }

  void loaddata() async {
    await Future.delayed(Duration(seconds: 10));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModal.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});

    //print(decodeData);
    //print(productData);
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(50, (index) => CatalogModal.item[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // ignore: unnecessary_null_comparison
        child: (CatalogModal.items != null && CatalogModal.items.isNotEmpty)
            ? ListView.builder(
                //itemCount: CatalogModal.item.length,
                //following code for dummy list for teting app if don't have data.

                //itemCount: dummyList.length,
                itemCount: CatalogModal.items.length,

                itemBuilder: (context, index) {
                  return ItemWidget(
                    //item: CatalogModal.item[index],
                    //following code for dummy list for teting app if don't have data.
                    // item: dummyList[index],
                    item: CatalogModal.items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
