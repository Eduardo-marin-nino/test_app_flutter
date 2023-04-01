import 'package:flutter/material.dart';
import 'package:test_app_flutter/gui/widgets/app_bar.dart';
import 'package:test_app_flutter/core/paths/local_paths.dart';
import 'package:test_app_flutter/gui/widgets/card_form_auth.dart';
import 'package:test_app_flutter/gui/widgets/background_gradient.dart';

class AuthTemplate extends StatelessWidget {
  final Widget child;
  final double? heightTemplate;

  const AuthTemplate({
    Key? key,
    this.heightTemplate,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        showGradient: false,
      ),
      body: BackGroundGradient(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Positioned(
                top: size.height * heightTemplate!,
                child: Image.asset(
                  LocalAppPaths.imgLogoName,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: CardFormAuth(
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
