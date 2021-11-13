class Orders {
  String id_orders;
  String user_clients_orders;
  int total_orders;


  Orders({required this.id_orders,
    required this.user_clients_orders,
    required this.total_orders});
}

class OrdersDAO {
  List <Orders> orders = [
    Orders(id_orders: '1',
        user_clients_orders: 'brayandavila',
        total_orders: 25000)
  ];
}