class Detorders {
  String id_detorders;
  String id_products_detorders;
  int amount_detorders;
  int total_detorders;


  Detorders(
      {required this.id_detorders,
      required this.id_products_detorders,
      required this.amount_detorders,
      required this.total_detorders});
}

class DetordersDao {
  List <Detorders> detorders = [
    Detorders(
        id_detorders: '1',
        id_products_detorders: '1',
        amount_detorders: 2,
        total_detorders: 25000)
  ];
}