class Clients {
  String nameClients;
  String addressClients;
  String landlineClients;
  String phoneClients;
  String userClients;
  String passwordClients;


  Clients({required this.nameClients,
    required this.addressClients,
    required this.landlineClients,
    required this.phoneClients,
    required this.userClients,
    required this.passwordClients});
}

class ClientsDAO {
  List <Clients> clients = [
    Clients(
        nameClients: 'Brayan Dávila',
        addressClients: 'Calle 65 # 25 - 31',
        landlineClients: '6979212',
        phoneClients: '3203636390',
        userClients: 'brayandavila',
        passwordClients: '12345678')
  ];
}
