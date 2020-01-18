import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ppanda/theme/images.dart';
import 'package:ppanda/theme/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class ShopItem {
  final AssetImage image;

  ShopItem(this.image);
}

class _HomeScreenState extends State<HomeScreen> {

  List<ShopItem> shopItems = [
    ShopItem(Images.item1),
    ShopItem(Images.item2),
    ShopItem(Images.item3),
    ShopItem(Images.item4),
    ShopItem(Images.item5),
    ShopItem(Images.item6),
    ShopItem(Images.item7),
    ShopItem(Images.item9),
    ShopItem(Images.item10),
    ShopItem(Images.item11),
    ShopItem(Images.item12),
    ShopItem(Images.item13),
    ShopItem(Images.item14),
    ShopItem(Images.item15),
    ShopItem(Images.item16),
    ShopItem(Images.item17),
    ShopItem(Images.item18),
    ShopItem(Images.item19),
    ShopItem(Images.item20),
    ShopItem(Images.item21),
    ShopItem(Images.item22),
    ShopItem(Images.item23),
    ShopItem(Images.item24),
    ShopItem(Images.item25),
    ShopItem(Images.item26),
    ShopItem(Images.item27),
    ShopItem(Images.item28),
    ShopItem(Images.item29),
    ShopItem(Images.item30),
    ShopItem(Images.item31),
    ShopItem(Images.item32),
    ShopItem(Images.item33),
    ShopItem(Images.item34),
    ShopItem(Images.item35),
    ShopItem(Images.item36),
    ShopItem(Images.item37),
    ShopItem(Images.item38),
    ShopItem(Images.item39),
    ShopItem(Images.item40),
    ShopItem(Images.item41),
    ShopItem(Images.item42),
    ShopItem(Images.item43),
    ShopItem(Images.item44),
    ShopItem(Images.item45),
    ShopItem(Images.item46),
    ShopItem(Images.item47),
    ShopItem(Images.item48),
    ShopItem(Images.item49),
    ShopItem(Images.item50),
    ShopItem(Images.item51),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: shopItems.length,
          itemBuilder: (BuildContext context, int index){

            final shopItem = shopItems[index];

            return Container(
              key: Key('shopItem$index'),
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      width: double.infinity,
                      child: Image(
                        image: shopItem.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Colors.redAccent.withOpacity(0.4),
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Great Tort',
                            style: AppTextStyle.itemTitle,
                          ),
                          Text(
                            '71₪',
                            style: AppTextStyle.price,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
