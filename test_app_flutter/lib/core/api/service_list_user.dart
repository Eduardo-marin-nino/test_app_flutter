import 'package:test_app_flutter/core/api/generic_api.dart';
import 'package:test_app_flutter/core/paths/local_paths.dart';
import 'package:test_app_flutter/data/models/user_model/user_model.dart';

class ServiceListUser {
  Future<List<UserModel>?> getUsers(int page) async =>
      GenericApi<List<UserModel>, Map<String, dynamic>>(
        endpoint: '${LocalAppPaths.urlApi}/users?page=$page',
        callback: (response) => (response != null)
            ? List.from(
                response["data"].map(
                  (value) => UserModel.fromJson(value),
                ),
              )
            : [],
      ).getAll();
}
