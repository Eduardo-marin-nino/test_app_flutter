import "package:flutter/material.dart";
import "package:test_app_flutter/gui/widgets/activity_indicator.dart";
import "package:test_app_flutter/data/models/user_model/user_model.dart";
import "package:test_app_flutter/gui/widgets/card_list_information.dart";

class RenderListUser extends StatelessWidget {
  const RenderListUser({
    super.key,
    required this.hasMore,
    required this.users,
    required this.controller,
  });

  final bool hasMore;
  final List<UserModel?> users;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding:
            const EdgeInsets.only(bottom: (kBottomNavigationBarHeight * 1.6)),
        controller: controller,
        itemCount: users.length + 1,
        itemBuilder: (_, index) {
          if (index < users.length) {
            final user = users[index];
            return CardListInformation(
              image: user!.avatar!,
              title: "${user.firtsName} ${user.lastName}",
              subTitle: user.email,
            );
          } else {
            return hasMore
                ? const ActivityIndicator()
                : const Center(
                    child: Text("No se encontró más data"),
                  );
          }
        });
  }
}
