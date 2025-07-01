import 'package:flutter/material.dart';
import 'drawer.header.widget.dart';
import 'drawer.item.widget.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeaderWidget(),
          DrawerItemWidget(
            icon: Icons.home,
            title: "Home",
            onTap: () => Navigator.pop(context),
          ),
          DrawerItemWidget(
            icon: Icons.quiz,
            title: "Quiz",
            onTap: () => Navigator.pushNamed(context, '/quiz'),
          ),
          DrawerItemWidget(
            icon: Icons.add,
            title: "Counter",
            onTap: () => Navigator.pushNamed(context, '/counter'),
          ),
          DrawerItemWidget(
            icon: Icons.contacts,
            title: "Contacts",
            onTap: () => Navigator.pushNamed(context, '/contacts'),
          ),
          DrawerItemWidget(
            icon: Icons.cloud,
            title: "Weather",
            onTap: () => Navigator.pushNamed(context, '/weather'),
          ),
          DrawerItemWidget(
            icon: Icons.photo,
            title: "Gallery",
            onTap: () => Navigator.pushNamed(context, '/gallery'),
          ),
        ],
      ),
    );
  }
}
