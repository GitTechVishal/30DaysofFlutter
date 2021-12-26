import 'package:flutter/material.dart';
import 'package:flutter_application_1/modals/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      color: Colors.grey,
      child: ListTile(
        onTap: () {
          print("${item.price} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
            textScaleFactor: 1.5,
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
