import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ppanda/services/shop_service.dart';
import 'package:ppanda/theme/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: ShopService.items.length,
          itemBuilder: (BuildContext context, int index){

            final shopItem = ShopService.items[index];

            return Container(
              key: Key('shopItem${shopItem.id}'),
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, 'shopItem', arguments: {'id': shopItem.id});
                  },
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
                              shopItem.name,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
