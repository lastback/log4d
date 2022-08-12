import 'dart:async';

import 'package:log4d/log4d.dart';

class LogHelper {
  late Log4dClient _client;

  bool isLog = true;

  bool isRemote = true;

  static final LogHelper _instance = LogHelper._();

  static LogHelper get instance => _instance;

  LogHelper._() {
    _client = Log4dClient(host: '172.18.4.208', port: 8899);
  }

  Future connectRemote() async {
    await _client.connect();
  }

  // factory LogHelper() {
  //   return _instance;
  // }

  void info(String msg) {
    // if (isLog) print(msg);
    if (isLog && isRemote) {
      _client.sendString(msg);
    }
  }
}

void main() async {
  Uri uri = Uri.parse('ws://172.18.4.208:8899/ws');
  print('${uri.host}${uri.port}');
  // var log = LogHelper.instance;
  // await log.connectRemote();

  // log.info("你好");
}
