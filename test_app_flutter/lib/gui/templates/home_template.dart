import 'package:flutter/material.dart';
import 'package:test_app_flutter/gui/widgets/background_gradient.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({
    Key? key,
    this.appBar,
    this.padding,
    this.physics,
    this.isBottomBar = false,
    this.bottomSafeArea = true,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final bool isBottomBar;
  final bool? bottomSafeArea;
  final ScrollPhysics? physics;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: BackGroundGradient(
        padding: padding,
        physics: physics,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            bottom: bottomSafeArea!,
            child: child,
          ),
        ),
      ),
      // bottomNavigationBar: isBottomBar ? const BottomBarNavigation() : null,
    );
  }
}
