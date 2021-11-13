class Products {
  String id_products;
  String name_products;
  String id_business_products;
  int price_products;

  Products({
    required this.id_products,
    required this.name_products,
    required this.id_business_products,
    required this.price_products});
}

class ProductsDAO {
  List <Products> products = [
    Products(
        id_products: '1',
        name_products: 'Hamburguesa',
        id_business_products: '1',
        price_products: 20000)
  ];
}