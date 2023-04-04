import 'package:test_app_flutter/data/models/response_api_models/response_api_model.dart';

import 'generic_api.dart';

class AuthenticationService {
  Future<ResponseAPiModel?> loginUser(Map<String, dynamic> data) async =>
      GenericApi<ResponseAPiModel?, Map<String, dynamic>>(
        endpoint: "login",
        body: data,
        statusCode: [200],
        callback: (response) => (response != null)
            ? ResponseAPiModel.fromJson(response)
            : const ResponseAPiModel(),
      ).create();

  Future<ResponseAPiModel?> registerUser(Map<String, dynamic> data) async =>
      GenericApi<ResponseAPiModel?, Map<String, dynamic>>(
        endpoint: "register",
        body: data,
        statusCode: [200],
        callback: (response) => (response != null)
            ? ResponseAPiModel.fromJson(response)
            : const ResponseAPiModel(),
      ).create();
}
