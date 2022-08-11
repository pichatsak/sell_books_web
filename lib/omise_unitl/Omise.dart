import 'package:sell_books_web/omise_unitl/ClientOmise.dart';
import 'package:sell_books_web/omise_unitl/res/SourceResourceOmise.dart';
import 'package:sell_books_web/omise_unitl/res/TokenResourceOmise.dart';

const String _VERSION = "0.1.6";

/// OmiseFlutter
///
/// ```dart
/// OmiseFlutter omise = OmiseFlutter(publicKey);
/// ```
class OmiseFlutterNew {
  // Omise API version
  final String apiVersion;
  // Omise Public Key
  final String publicKey;

  // HTTP Clientd
  late ClientOmise _client;
  ClientOmise get client {
    return _client;
  }

  // Resources
  late TokenResourceOmise token;
  late SourceResourceOmise source;
  // late CapabilityResource capability;

  // Constructor
  OmiseFlutterNew(this.publicKey, [this.apiVersion = '2019-05-29']) {
    //
    _client = new ClientOmise(publicKey, apiVersion);
    _client.version = _VERSION;
    _initResources();
  }

  _initResources() {
    token = new TokenResourceOmise(_client, publicKey, apiVersion);
    source = new SourceResourceOmise(_client, publicKey, apiVersion);
    // capability = new CapabilityResource(_client, publicKey, apiVersion);
  }
}
