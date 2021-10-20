
import 'dart:convert' as convert;

import 'package:behtrino_test/constant/const_repository.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class ChatNetworkService{
  Function subscribeFromServer;
  ChatNetworkService({required this.subscribeFromServer}){
    subscribeFromServer = subscribeFromServer;
  }
  final client = MqttServerClient('185.86.181.206', '');
  Future<MqttServerClient?> connectMQTT(String otpToken,String userToken) async {
    client.port = 31789;
    client.logging(on: true);
    client.keepAlivePeriod = 30;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    final connMess = MqttConnectMessage()
        .withClientIdentifier('Mqtt_MyClientUniqueIdQ1')
        .withWillTopic('willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;

    try {
      await client.connect(usernameOfChat,passwordOfChat);
    } on Exception {
      client.disconnect();
    }
    var topic = "challenge/user/$userToken/$otpToken/";
    client.subscribe(topic, MqttQos.atLeastOnce);
    /// Check we are connected
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
    } else {
      client.disconnect();
      // exit(-1);
    }
    client.updates!.listen((dynamic c) {
      final MqttPublishMessage recMess = c[0].payload;
      String pt =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      pt = convert.utf8.decode(pt.codeUnits);
      subscribeFromServer(pt);

    });

    return client;
  }

  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
  }

  pushMessageToServer(String otpToken, String userToken, String message) {
    try {
      var topic = "challenge/user/$otpToken/$userToken/";
      final builder1 = MqttClientPayloadBuilder();
      builder1.addUTF8String(message);
      client.publishMessage(topic, MqttQos.atLeastOnce, builder1.payload!);
    }
    catch(error){
      rethrow;
    }


  }



}