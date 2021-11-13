class Clients {
  String name_cients;
  String address_cients;
  String landline_cients;
  String phone_cients;
  String user_clients;
  String password_clients;


  Clients({required this.name_cients,
    required this.address_cients,
    required this.landline_cients,
    required this.phone_cients,
    required this.user_clients,
    required this.password_clients});
}

class ClientsDAO {
  List <Clients> clients = [
    Clients(
        name_cients: 'Brayan Dávila',
        address_cients: 'Calle 65 # 25 - 31',
        landline_cients: '6979212',
        phone_cients: '3203636390',
        user_clients: 'brayandavila',
        password_clients: '12345678')
  ];
}
