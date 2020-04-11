import 'package:flutter/material.dart';
import 'package:ppanda/theme/app_colors.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.primary,
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
//          DrawerHeader(
//            child: Text('Drawer Header'),
//            decoration: BoxDecoration(
//              color: Colors.blue,
//            ),
//          ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}