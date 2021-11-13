
enum product_c {
  //imagino que acá se llama al modelo de productos
  Restaurante, PerroCaliente
}

class Business {
  String id_bussiness;
  String name_business;
  String address_business;
  String geolocation_business;
  String landline_business;
  String phone_business;
  String website_business;
  product_c category_business;
  String logo_business;
  String photo_business;

  Business({
    required this.id_bussiness,
    required this.name_business,
    required this.address_business,
    required this.geolocation_business,
    required this.landline_business,
    required this.phone_business,
    required this.website_business,
    required this.category_business,
    required this.logo_business,
    required this.photo_business});
}

class BusinessDAO {
  List <Business> business = [
    Business(//y supongo que aquí llamamos un .cvs o algo así
        id_bussiness: '1',
        name_business: 'AlRock',
        address_business: 'Calle 105 # 26 - 93',
        geolocation_business: '7.087986918362485, -73.1091913345132',
        landline_business: '+5776368888',
        phone_business: '315 695 8555',
        website_business: 'https://www.instagram.com/alrock_burger/?hl=es-la',
        category_business: product_c.Restaurante,
        logo_business: 'logoalrock.png',
        photo_business: 'photoalrock.png')
  ];
}
