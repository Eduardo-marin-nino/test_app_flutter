import 'package:flutter_test/flutter_test.dart';
import 'package:test_app_flutter/core/api/service_list_user.dart';
import 'package:test_app_flutter/core/config/dotenv_config.dart';
import 'package:test_app_flutter/data/models/user_model/user_model.dart';

void main() {
  late ServiceListUser serviceUser;

  setUpAll(() {
    DotEnvAppPath.testLoad();
    serviceUser = ServiceListUser();
  });
  testWidgets('service list user ...', (tester) async {
    final List<UserModel>? users = await serviceUser.getUsers(1);
    expect(users, isNot(equals(null)));
    expect(users!.length, isNot(equals(0)));
  });
}
