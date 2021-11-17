import 'dart:convert';
import 'package:http/http.dart' as http;

class Products {
  final int id_products;
  final String name_products;
  final int id_business_products;
  final double price_products;

  Products(
      this.id_products,
      this.name_products,
      this.id_business_products,
      this.price_products
      );
}

Future<List<Products>> getProduct() async {
  final response = await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbyTPUvDMYPXyv2CIkAq6jf1_1RCtb7tPghjkGMO1lUczdZW-N8q/exec?&acc=1&tbl=Products'));
  List<Products> product = [];
  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    for(var item in jsonData["data"]){
      product.add(
          Products(
              item["id_products"],
              item["name_products"],
              item["id_business_products"],
              item["price_products"])
      );
    }
    print(product);
    return product;
  } else {
    throw Exception('Falló');
  }
}