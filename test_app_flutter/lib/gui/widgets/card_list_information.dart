import 'package:flutter/material.dart';
import 'package:test_app_flutter/core/theme/colors_app_theme.dart';

class CardListInformation extends StatelessWidget {
  const CardListInformation({
    super.key,
    required this.title,
    required this.image,
    this.subTitle,
  });

  final String title;
  final String image;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[400]!)),
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
          radius: 42,
          backgroundColor: Colors.grey[100],
          backgroundImage: image.isNotEmpty ? NetworkImage(image) : null,
          child: image.isEmpty ? _iconPhoto() : null,
        ),
        subtitle: subTitle!.isNotEmpty ? Text(subTitle!) : null,
      ),
    );
  }

  Widget _iconPhoto() => const Icon(
        Icons.person,
        size: 36,
        color: ColorsAppTheme.primaryColor,
      );
}
