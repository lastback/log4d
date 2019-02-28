import 'dart:convert';

class LogEntity {
  String msg;

  Level level = Level.debug;

  bool showTime = true;

  bool showColor = true;

  Map<String, dynamic> toMap() {
    return {
      "msg": msg,
      "level": level.index,
      "showTime": showTime,
      "showColor": showColor,
    };
  }

  String toJson() {
    return json.encode(toMap());
  }

  LogEntity({
    this.msg,
    this.level = Level.debug,
    this.showTime = true,
    this.showColor: true,
  });

  factory LogEntity.fromString(String jsonString) {
    try {
      Map<String, dynamic> map = json.decode(jsonString);
      return LogEntity(
        msg: map["msg"] ?? "",
        level: Level.values[(map["level"] ?? 0)],
        showTime: map["showTime"] ?? true,
        showColor: map["showColor"] ?? true,
      );
    } on Error {
      return null;
    } on Exception {
      return null;
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
