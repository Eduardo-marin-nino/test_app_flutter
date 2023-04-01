import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvAppPath {
  static Future<void> load() async =>
      await dotenv.load(fileName: "assets/.env");
}
