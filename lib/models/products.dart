import 'dart:convert';
import 'package:http/http.dart' as http;

class Products {
  final int idProducts;
  final String nameProducts;
  final int idBusinessProducts;
  final int priceProducts;

  Products(
      this.idProducts,
      this.nameProducts,
      this.idBusinessProducts,
      this.priceProducts
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
    return product;
  } else {
    throw Exception('Falló');
  }
}