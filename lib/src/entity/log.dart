import 'dart:convert';

class LogEntity {
  String msg;

  Level level = Level.debug;

  bool showTime = false;

  bool showColor = false;

  bool force = false;

  Map<String, dynamic> toMap() {
    return {
      "msg": msg,
      "level": level.index,
      "showTime": showTime,
      "showColor": showColor,
      "force": force,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  LogEntity({
    required this.msg,
    this.level = Level.debug,
    this.showTime = false,
    this.showColor = false,
    this.force = false,
  });

  factory LogEntity.fromString(String jsonString) {
    try {
      Map<String, dynamic> map = json.decode(jsonString);
      return LogEntity(
        msg: map["msg"] ?? "",
        level: Level.values[(map["level"] ?? 0)],
        showTime: map["showTime"] ?? false,
        showColor: map["showColor"] ?? false,
        force: map["force"] ?? false,
      );
    } on Error {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  String toString() {
    return this.toJson();
  }
}

enum Level {
  error,
  warning,
  info,
  debug,
}
