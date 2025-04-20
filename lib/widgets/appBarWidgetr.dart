import 'package:flutter/material.dart';

class appBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const appBarWidget({
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String title;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              onPressed: () {},
              icon: icon
            ),
          ),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
