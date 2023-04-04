import "package:flutter/material.dart";
import "package:test_app_flutter/gui/widgets/activity_indicator.dart";
import "package:test_app_flutter/gui/widgets/button_generic.dart";
import "package:test_app_flutter/gui/widgets/text_form_input.dart";
import "package:test_app_flutter/gui/templates/auth_template.dart";
import "package:test_app_flutter/core/utils/hooks/use_validations.dart";

import "register_controller.dart";

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterController controller;

  @override
  void initState() {
    controller = RegisterController(context)..init();
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
      heightTemplate: 0.22,
      child: Form(
        key: controller.formKeyRegister,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Registro',
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
              controller: controller.passwordController,
              keyBoardType: TextInputType.text,
              obscureText: true,
              hintText: 'Contraseña',
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Contraseña obligatoria';
                }
                return null;
              },
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 40),
            ValueListenableBuilder<bool>(
              valueListenable: controller.isLoading,
              builder: (context, loading, child) {
                return loading ? const ActivityIndicator() : child!;
              },
              child: ButtonWidget(
                label: 'Crear cuenta',
                onTap: controller.onRegister,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
