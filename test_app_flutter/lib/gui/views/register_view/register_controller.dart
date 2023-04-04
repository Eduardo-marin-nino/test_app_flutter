import 'package:flutter/material.dart';
import 'package:test_app_flutter/core/api/authentication_service.dart';
import 'package:test_app_flutter/core/utils/hooks/use_navigations.dart';
import 'package:test_app_flutter/gui/widgets/snackbar_alert.dart';

class RegisterController {
  late BuildContext _context;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  //Provider

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  static final RegisterController _singleton = RegisterController._();
  factory RegisterController(BuildContext context) =>
      _singleton._instance(context);
  RegisterController._();

  RegisterController _instance(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  void init() {
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  void onRegister() async {
    if (formKeyRegister.currentState!.validate()) {
      isLoading.value = true;

      final data = {
        "email": emailController.text,
        "password": passwordController.text,
      };

      final response = await AuthenticationService().registerUser(data);

      isLoading.value = false;

      if (response!.token!.isNotEmpty) {
        _redirect();
      } else {
        _snackbar(response.error!);
      }
    }
  }

  void _redirect() => useNavigateReplacePage(_context, "main");

  void _snackbar(String message) {
    SnackBarFloating.show(_context, message, type: TypeAlert.error);
  }

  void dispose() {
    passwordController.dispose();
    emailController.dispose();
  }
}
