
enum product_c {
  //imagino que acá se llama al modelo de productos
  restaurante, perroCaliente
}

class Business {
  String idBusiness;
  String nameBusiness;
  String addressBusiness;
  String geolocationBusiness;
  String landlineBusiness;
  String phoneBusiness;
  String websiteBusiness;
  product_c categoryBusiness;
  String logoBusiness;
  String photoBusiness;

  Business({
    required this.idBusiness,
    required this.nameBusiness,
    required this.addressBusiness,
    required this.geolocationBusiness,
    required this.landlineBusiness,
    required this.phoneBusiness,
    required this.websiteBusiness,
    required this.categoryBusiness,
    required this.logoBusiness,
    required this.photoBusiness});
}

class BusinessDAO {
  List <Business> business = [
    Business(//y supongo que aquí llamamos un .cvs o algo así
        idBusiness: '1',
        nameBusiness: 'AlRock',
        addressBusiness: 'Calle 105 # 26 - 93',
        geolocationBusiness: '7.087986918362485, -73.1091913345132',
        landlineBusiness: '+5776368888',
        phoneBusiness: '315 695 8555',
        websiteBusiness: 'https://www.instagram.com/alrock_burger/?hl=es-la',
        categoryBusiness: product_c.restaurante,
        logoBusiness: 'logoalrock.png',
        photoBusiness: 'photoalrock.png')
  ];
}
