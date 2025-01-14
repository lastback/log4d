import 'package:log4d/log4d.dart' as log4d;
import 'package:args/args.dart';

main(List<String> args) {
  var parser = ArgParser();
  parser.addOption('output', abbr: 'o', help: "output path");
  parser.addOption('host',
      abbr: 'h', help: "server host", defaultsTo: "localhost");
  parser.addOption('port', abbr: 'p', help: "server port", defaultsTo: "8899");
  parser.addFlag('help', abbr: "b", help: "usage");
  parser.addFlag('console',
      abbr: "c", help: "show log in console", defaultsTo: true);

  ArgResults results;
  try {
    results = parser.parse(args);
  } on FormatException catch (e) {
    print(e.message);
    return;
  }

  if (results["help"]) {
    print(parser.usage);
    return;
  }

  String outputPath = results["output"];
  String host = results['host'];
  int? port = int.tryParse(results["port"]);

  var server = log4d.Log4dServer(
    host: host,
    outPath: outputPath,
    port: port ?? 8899,
    showConsole: results["console"],
  );
  server.serve();
}
