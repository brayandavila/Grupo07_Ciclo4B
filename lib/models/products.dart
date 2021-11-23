import 'dart:convert';
import 'package:http/http.dart' as http;

class Products {
  final int idProducts;
  final String nameProducts;
  final int idBusinessProducts;
  final int priceProducts;

  Products(this.idProducts, this.nameProducts, this.idBusinessProducts,
      this.priceProducts);
}

const url =
    'https://script.google.com/macros/s/AKfycbzFqNfaEZxCWLs-4l7a8pgyiKpd8Cs8T0yc6fSLJckraKT-vsFsk8Sv7lVKi5FJP1PVWA/exec?';

Future<List<Products>> getProduct() async {
  final response = await http.get(Uri.parse(url + '&acc=1&tbl=Products'));
  List<Products> product = [];
  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    for (var item in jsonData["data"]) {
      product.add(Products(item["id_products"], item["name_products"],
          item["id_business_products"], item["price_products"]));
    }
    return product;
  } else {
    throw Exception('Falló al obtener productos');
  }
}

Future<List> getSearch(query) async {
  final response =
      await http.get(Uri.parse(url + '&acc=3&tbl=Products&query=' + query));
  if (response.statusCode == 200) {
    var convertJSON = jsonDecode(response.body);
    var result = convertJSON["data"];
    return result;
  } else {
    throw Exception('Falló la búsqueda');
  }
}


Future<List> getProductsBusiness(idB) async {
  final response =
      await http.get(Uri.parse(url + '&acc=4&idB=' + idB));
  if (response.statusCode == 200) {
    var convertJSON = jsonDecode(response.body);
    var result = convertJSON["data"];
    return result;
  } else {
    throw Exception('Falló la búsqueda');
  }
}