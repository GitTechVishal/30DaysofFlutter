class CatalogModal {
  static List<Item> items = [];
}

//model
class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

//1st default Constructor.
  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

//2nd Named Constructor Way to DECODE
  factory Item.fromMap(Map<dynamic, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
//way to ENCODE
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
