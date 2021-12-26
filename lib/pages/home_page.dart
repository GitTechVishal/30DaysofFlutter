import 'package:flutter/material.dart';
import 'package:flutter_application_1/modals/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "Flutter Learn";

//Day 11 We learnt Build Context, 3 Trees & Constraints Explained

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModal.item[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          //itemCount: CatalogModal.item.length,
          //following code for dummy list for teting app if don't have data.
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              //item: CatalogModal.item[index],
              //following code for dummy list for teting app if don't have data.
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
