import 'package:flutter/material.dart';
import 'package:test_app_flutter/core/api/authentication_service.dart';
import 'package:test_app_flutter/core/utils/hooks/use_navigations.dart';
import 'package:test_app_flutter/gui/widgets/snackbar_alert.dart';

class LoginController {
  late BuildContext _context;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static final LoginController _singleton = LoginController._();
  factory LoginController(BuildContext context) =>
      _singleton._instance(context);
  LoginController._();

  LoginController _instance(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  void init() {
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  void onLogin() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      final data = {
        "email": emailController.text,
        "password": passwordController.text,
      };

      final response = await AuthenticationService().loginUser(data);

      isLoading.value = false;

      if (response!.token!.isNotEmpty) {
        _redirect();
      } else {
        _snackbar(response.error!);
      }
    }
  }

  void _redirect() => useNavigateReplaceName(_context, "main");

  void _snackbar(String message) {
    SnackBarFloating.show(_context, message, type: TypeAlert.error);
  }

  void dispose() {
    isLoading.value = false;
    passwordController.dispose();
    emailController.dispose();
  }
}
