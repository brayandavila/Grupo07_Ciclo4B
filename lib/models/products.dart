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
    'https://script.google.com/macros/s/AKfycbylEWkWAsoJ2r0d7OEUSGwEmrbqv0XlqGa6qFuKGKBAb1oEOGG7iB7Kyf4MNg-0fy4WXQ/exec?';

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
List<String> ids = [];
List<int> precios = [];
List<Products> product = [] ;
Future<List<Products>> cart(add1) async {  
  totalito = totalito + add1[3];
  ids.add(add1[0].toString());
  precios.add(add1[3]);
  if (add1 != null){    
    product.add(
      Products(
        add1[0], 
        add1[1], 
        add1[2], 
        add1[3],
      )
    ); 
  return product;
  } else {
    throw Exception('Falló al obtener productos');
  }
}
num totalito = 0;

Future<List<void>> getOrder() async {
  return product;
}

deleteProduct(id){
  int position = 0;
  for (var i = 0; i < ids.length; i++){
    if (id.toString() == ids[i].toString()){
      position = i;      
    } 
  }//función wasa wasa
  for (var j = 0; j < product.length; j++){
    if (j == position){
      product.remove(product[j]);
      ids.remove(ids[j]);
      totalito = totalito - precios[j];
      precios.remove(precios[j]);
    }
  }
  return position;
}

 
