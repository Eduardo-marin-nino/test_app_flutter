import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocalAppPaths {
  static String imgLogoName = dotenv.env['imgLogoName']!;
  static String imgBackgroundGradient = dotenv.env['imgBackgroundGradient']!;
}
