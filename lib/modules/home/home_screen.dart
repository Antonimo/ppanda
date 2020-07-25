import 'dart:async';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ppanda/modules/app_drawer.dart';
import 'package:ppanda/services/shop_service.dart';
import 'package:ppanda/theme/app_colors.dart';
import 'package:ppanda/theme/images.dart';
import 'package:ppanda/theme/text_style.dart';
import 'package:ppanda/utils/screen_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentHeroImage = 0;
  final List<AssetImage> heroAssetImages = [
    Images.item9,
    Images.item10,
    Images.item5,
  ];

  Timer heroSliderTimer;

  @override
  void initState() {
    super.initState();

    heroSliderTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        currentHeroImage++;
        if (currentHeroImage >= heroAssetImages.length) {
          currentHeroImage = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    heroSliderTimer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      drawer: AppDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          final List<Widget> heroImages = heroAssetImages
              .asMap()
              .map((index, image) {
                return MapEntry(
                  index,
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity: index == currentHeroImage ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      child: Image(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              })
              .values
              .toList();

          return <Widget>[
            SliverAppBar(
              expandedHeight: ScreenInfo.safeAreaHeight,
              floating: false,
              pinned: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image(
                        image: Images.logo,
                        height: 32.0,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        'ppanda',
                        style: AppTextStyle.brand1,
                      ),
                    ],
                  ),
                  Badge(
                    badgeContent: Text(
                      '3',
                      style: AppTextStyle.badge,
                    ),
                    badgeColor: AppColors.primary[100],
                    child: Icon(
                      Icons.shopping_cart,
                      color: AppColors.cardTitle,
                    ),
                  ),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
//                title: Text(
//                  "Collapsing Toolbar",
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 16.0,
//                  ),
//                ),
                background: Stack(
                  children: <Widget>[
                    Container(
                      height: ScreenInfo.height,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Stack(
                              children: heroImages,
                            ),
                          ),
                          Positioned.fill(
                            bottom: 16.0,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  PrimaryScrollController.of(context).animateTo(
                                    ScreenInfo.safeAreaHeight - kToolbarHeight + 10.0,
                                    duration: const Duration(milliseconds: 1000),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: SpinKitPumpingHeart(size: 32.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Image(
                          image: Images.bg1,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Image(
                          image: Images.bg1,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Image(
                          image: Images.bg1,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  child: ListView.builder(
                    primary: false,
                    itemCount: ShopService.items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final shopItem = ShopService.items[index];

                      return Container(
                        key: Key('shopItem${shopItem.id}'),
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                        height: 120.0 + 16 + 16 + 16 + 16 + 20 + 8,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: <Widget>[
                              Column(
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
//                                    color: AppColors.primary[900],
                                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          shopItem.name,
                                          style: AppTextStyle.itemTitle,
                                        ),
//                              Text(
//                                '71₪',
//                                style: AppTextStyle.price,
//                              )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'shopItem', arguments: {'id': shopItem.id});
                                  },
                                  splashColor: AppColors.primary[200].withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
