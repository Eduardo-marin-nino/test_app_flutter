import 'package:flutter_test/flutter_test.dart';
import 'package:test_app_flutter/core/config/dotenv_config.dart';
import 'package:test_app_flutter/core/api/authentication_service.dart';
import 'package:test_app_flutter/data/models/response_api_models/response_api_model.dart';

void main() {
  setUpAll(() {
    DotEnvAppPath.testLoad();
  });

  testWidgets('authentication service ...', (tester) async {
    group("test auth implementation", () {
      final authService = AuthenticationService();

      test("Sucess Login", () async {
        final ResponseAPiModel? response = await authService
            .loginUser({"email": "eve.holt@reqres.in", "password": "pistol"});

        expect(response, isA<ResponseAPiModel>());
      });

      test("Succes Register", () async {
        final ResponseAPiModel? response = await authService.registerUser(
            {"email": "eve.holt@reqres.in", "password": "pistol"});

        expect(response, isA<ResponseAPiModel>());
      });
    });
  });
}
