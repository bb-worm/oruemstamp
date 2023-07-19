import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key, required this.appBar, required this.image});

  final AppBar appBar;

  final String image;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Image.asset(
        image,
        width: 160,
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
          color: Colors.green,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
