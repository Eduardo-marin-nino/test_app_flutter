import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_flutter/data/models/user_model.dart';
import 'package:test_app_flutter/core/providers/user_provider.dart';
import 'package:test_app_flutter/core/utils/hooks/use_navigations.dart';

class RegisterController {
  late BuildContext _context;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController lastNameController;

  //Provider
  late UserProvider _userProvider;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  static final RegisterController _singleton = RegisterController._();
  factory RegisterController(BuildContext context) =>
      _singleton._instance(context);
  RegisterController._();

  RegisterController _instance(BuildContext context) {
    _singleton._context = context;
    _singleton._userProvider = context.read<UserProvider>();
    return _singleton;
  }

  void init() {
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
  }

  void onLogin() {
    if (formKeyRegister.currentState!.validate()) {
      final user = UserModel(
        firtsName: nameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
      );
      _userProvider.user = user;
      useNavigateReplacePage(_context, "profile");
    }
  }

  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
  }
}
