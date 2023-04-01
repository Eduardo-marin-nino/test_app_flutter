import "package:flutter/material.dart";
import "package:test_app_flutter/gui/widgets/button_generic.dart";
import "package:test_app_flutter/gui/widgets/text_form_input.dart";
import "package:test_app_flutter/gui/templates/auth_template.dart";
import "package:test_app_flutter/core/utils/hooks/use_navigations.dart";
import "package:test_app_flutter/core/utils/hooks/use_validations.dart";

import "login_controller.dart";

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(context)..init();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      heightTemplate: 0.13,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Iniciar sesión',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormInput(
              controller: controller.emailController,
              keyBoardType: TextInputType.text,
              hintText: 'Correo electrónico',
              validator: (value) {
                if (value!.isEmpty) {
                  return "Este campo es requerido";
                } else if (!useValidateEmail(value)) {
                  return "Formado inválido";
                }
                return null;
              },
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            TextFormInput(
              controller: controller.lastNameController,
              keyBoardType: TextInputType.text,
              obscureText: true,
              hintText: 'Contraseña',
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'El apellido obligatorio';
                }
                return null;
              },
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 40),
            ButtonWidget(
              label: 'Ingresar',
              onTap: controller.onLogin,
              width: 200,
            ),
            const SizedBox(height: 30),
            TextButton(
                onPressed: () => useNavigatePushName(context, "register"),
                child: const Text(
                  "Registrar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
    );
  }
}
