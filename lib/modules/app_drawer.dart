import 'package:flutter/material.dart';
import 'package:ppanda/services/shop_service.dart';
import 'package:ppanda/theme/app_colors.dart';
import 'package:ppanda/theme/text_style.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.primary,
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.only(top: 12.0),

            children: <Widget>[
//          DrawerHeader(
//            child: Text('Drawer Header'),
//            decoration: BoxDecoration(
//              color: Colors.blue,
//            ),
//          ),
              Container(
                padding: EdgeInsets.only(right: 16.0),
                child: ListTile(
                  title: Text(
                    'תפריט',
                    style: AppTextStyle.menuTitle,
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ),

              ...getShopItemsMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getShopItemsMenuItems(BuildContext context) {
    return ShopService.items.map((ShopItem item) {
      return Container(
        padding: EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.separator,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'shopItem', arguments: {'id': item.id});
            },
            child: ListTile(
              title: Text(
                item.name,
                style: AppTextStyle.menuItem,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
