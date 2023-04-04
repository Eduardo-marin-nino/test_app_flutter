import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocalAppPaths {
  // Images
  static String imgLogoName = dotenv.env['imgLogoName']!;
  static String imgBackgroundGradient = dotenv.env['imgBackgroundGradient']!;

  // Endpoints
  static String urlApi = dotenv.env['urlApi']!;
  static String urlApiImages = dotenv.env['urlApiImages']!;
}
