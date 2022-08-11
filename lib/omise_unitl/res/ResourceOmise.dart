import 'package:sell_books_web/omise_unitl/ClientOmise.dart';

class ResourceOmise {
  final String publicKey;
  final String apiVersion;
  final ClientOmise client;

  ResourceOmise(this.client, this.publicKey, this.apiVersion);
}
