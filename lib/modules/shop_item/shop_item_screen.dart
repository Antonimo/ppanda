import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/block_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppanda/app_router.dart';
import 'package:ppanda/services/cart_service.dart';
import 'package:ppanda/services/shop_service.dart';

const _horizontalPadding = 32.0;
const _carouselItemMargin = 8.0;
const _carouselHeightMin = 200.0 + 2 * _carouselItemMargin;
const double systemTextScaleFactorOption = -1;

const _regular = FontWeight.w400;
const _medium = FontWeight.w500;
const _semiBold = FontWeight.w600;
const _bold = FontWeight.w700;

class ShopItemScreen extends StatefulWidget {
  final String itemId;

  ShopItemScreen(this.itemId);

  @override
  _ShopItemScreenState createState() => _ShopItemScreenState();
}

class _ShopItemScreenState extends State<ShopItemScreen> with SingleTickerProviderStateMixin {
  ShopItem shopItem;

  Map<String, dynamic> selectedOptions = {};

  int showOptionsItems = 1;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _animationController.value = 1.0;

    shopItem = ShopService.items.firstWhere((item) {
      return item.id == widget.itemId;
    });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final carouselCards = <Widget>[
      ...shopItem.images.map((AssetImage image) {
        return _CarouselCard(
          title: 'כותרת',
          subtitle: 'טקסט תיאור כלשהו',
          asset: image,
          textColor: Colors.pinkAccent,
        );
      }).toList(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 16.0),
                      Text(
                        shopItem.name,
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _Carousel(
                  children: carouselCards,
                  animationController: _animationController,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 16.0),
                      ...buildShopItemOptions(),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: RaisedButton(
                onPressed: () {

                  CartService.instance.updateCart(shopItem, selectedOptions);

                  AppRouter.navigateTo(AppRouter.routeOrderForm);

                },
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                child: Text(
                  'הזמן!',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildShopItemOptions() {
    List<Widget> optionsWidgets = [];

    int addedItems = 0;

    shopItem.options.forEach((option) {
      if (addedItems >= showOptionsItems) {
        return;
      }

      if (option.condition != null) {
        // TODO: support multiple choices

        print('option.condition.keys.first: ${option.condition.keys.first}');
        print('selectedOptions[option.condition.keys.first]: ${selectedOptions[option.condition.keys.first]}');

        print('option.condition.values.first: ${option.condition.values.first}');

        if (selectedOptions[option.condition.keys.first] == null || selectedOptions[option.condition.keys.first] != option.condition.values.first) {
          return;
        }
      }

      optionsWidgets.add(
        const SizedBox(height: 16.0),
      );

      optionsWidgets.add(
        Text(
          option.name,
          textAlign: TextAlign.start,
        ),
      );

      optionsWidgets.add(
        const SizedBox(height: 16.0),
      );

      if (option.choices != null) {
        // if the sub options have changed, and the selected value doesnt exist then reset the choice.
        if (selectedOptions[option.id] != null &&
            option.choices.where((ShopItemOptionChoice choice) {
                  return choice.id == selectedOptions[option.id];
                }).length !=
                1) {
          selectedOptions[option.id] = null;
        }

        optionsWidgets.add(
          DropdownButton<String>(
            isExpanded: true,
            hint: Text('בחר'),
            value: selectedOptions[option.id],
            // TODO: id
            items: option.choices.map((ShopItemOptionChoice choice) {
              return DropdownMenuItem<String>(
                value: choice.id,
                child: Text(choice.name),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                if (selectedOptions[option.id] == null) {
                  showOptionsItems++;
                }
                print('SETTING: selectedOptions[${option.name}]: $value');
                selectedOptions[option.id] = value;
              });
              print('value: $value');
            },
          ),
        );
      }

      if (option.type == 'color') {
        Color currentColor = Color(0xff443a49);

        optionsWidgets.add(
          RaisedButton(
            elevation: 3.0,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('בחר צבע'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: currentColor,
                        onColorChanged: (Color color) {
                          setState(() {
                            selectedOptions[option.id] = color;
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text('בחר צבע'),
            color: selectedOptions[option.id] ?? currentColor,
            textColor: useWhiteForeground(selectedOptions[option.id] ?? currentColor) ? const Color(0xffffffff) : const Color(0xff000000),
          ),
        );
      }

      addedItems++;
    });

    return optionsWidgets;
  }

  String getChoiceText(List<ShopItemOptionChoice> choices, selectedChoice) {
    final choice = choices.firstWhere(
      (item) {
        return item.id == selectedChoice;
      },
      orElse: () => null,
    );
    if (choice != null) {
      return choice.name;
    }
    return '';
  }
}

bool useWhiteForeground(Color color, {double bias: 1.0}) {
  // Old:
  // return 1.05 / (color.computeLuminance() + 0.05) > 4.5;

  // New:
  bias ??= 1.0;
  int v = math.sqrt(math.pow(color.red, 2) * 0.299 + math.pow(color.green, 2) * 0.587 + math.pow(color.blue, 2) * 0.114).round();
  return v < 130 * bias ? true : false;
}

class _CarouselCard extends StatelessWidget {
  const _CarouselCard({
    Key key,
    this.title,
    this.subtitle,
    this.asset,
    this.assetDark,
    this.assetColor,
    this.assetDarkColor,
    this.textColor,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final ImageProvider asset;
  final ImageProvider assetDark;
  final Color assetColor;
  final Color assetDarkColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    final asset = isDark ? assetDark : this.asset;
    final assetColor = isDark ? assetDarkColor : this.assetColor;
    final textColor = isDark ? Colors.white.withOpacity(0.87) : this.textColor;

    return Container(
      margin: EdgeInsets.all(_carouselItemMargin),
      child: Material(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        color: Colors.grey,
        child: InkWell(
//          onTap: () {},
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (asset != null)
                FadeInImagePlaceholder(
                  image: asset,
                  child: Ink.image(
                    image: asset,
                    fit: BoxFit.cover,
                  ),
                  placeholder: Container(
                    color: assetColor,
                  ),
                ),
//              Padding(
//                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  children: [
//                    Text(
//                      title,
//                      style: textTheme.caption.apply(color: textColor),
//                      maxLines: 3,
//                      overflow: TextOverflow.visible,
//                    ),
//                    Text(
//                      subtitle,
//                      style: textTheme.overline.apply(color: textColor),
//                      maxLines: 5,
//                      overflow: TextOverflow.visible,
//                    ),
//                  ],
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Carousel extends StatefulWidget {
  const _Carousel({
    Key key,
    this.children,
    this.animationController,
  }) : super(key: key);

  final List<Widget> children;
  final AnimationController animationController;

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<_Carousel> with SingleTickerProviderStateMixin {
  PageController _controller;
  int _currentPage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller == null) {
      // The viewPortFraction is calculated as the width of the device minus the
      // padding.
      final width = MediaQuery.of(context).size.width;
      final padding = (_horizontalPadding * 2) - (_carouselItemMargin * 2);
      _controller = PageController(
        initialPage: _currentPage,
        viewportFraction: (width - padding) / width,
      );
    }
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget builder(int index) {
    final carouselCard = AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value;
        if (_controller.position.haveDimensions) {
          value = _controller.page - index;
        } else {
          // If haveDimensions is false, use _currentPage to calculate value.
          value = (_currentPage - index).toDouble();
        }
        // We want the peeking cards to be 160 in height and 0.38 helps
        // achieve that.
        value = (1 - (value.abs() * .38)).clamp(0, 1).toDouble();
        value = Curves.easeOut.transform(value);

        return Center(
          child: Transform(
            transform: Matrix4.diagonal3Values(1.0, value, 1.0),
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
      child: widget.children[index],
    );

    // We only want the second card to be animated.
    if (index == 1) {
      return _AnimatedCarouselCard(
        child: carouselCard,
        controller: widget.animationController,
      );
    } else {
      return carouselCard;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _AnimatedCarousel(
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        controller: _controller,
        itemCount: widget.children.length,
        itemBuilder: (context, index) => builder(index),
      ),
      controller: widget.animationController,
    );
  }
}

/// Animates the carousel to come in from the right.
class _AnimatedCarousel extends StatelessWidget {
  _AnimatedCarousel({
    Key key,
    @required this.child,
    @required this.controller,
  })  : startPositionAnimation = Tween(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.200,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final Widget child;
  final AnimationController controller;
  final Animation<double> startPositionAnimation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          SizedBox(height: _carouselHeight(.4, context)),
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return PositionedDirectional(
                start: constraints.maxWidth * startPositionAnimation.value,
                child: child,
              );
            },
            child: Container(
              height: _carouselHeight(.4, context),
              width: constraints.maxWidth,
              child: child,
            ),
          ),
        ],
      );
    });
  }
}

/// Animates a carousel card to come in from the right.
class _AnimatedCarouselCard extends StatelessWidget {
  _AnimatedCarouselCard({
    Key key,
    @required this.child,
    @required this.controller,
  })  : startPaddingAnimation = Tween(
          begin: _horizontalPadding,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.900,
              1.000,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final Widget child;
  final AnimationController controller;
  final Animation<double> startPaddingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsetsDirectional.only(
            start: startPaddingAnimation.value,
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}

double _carouselHeight(double scaleFactor, BuildContext context) =>
    math.max(_carouselHeightMin * systemTextScaleFactorOption * scaleFactor, _carouselHeightMin);

/// An image that shows a [placeholder] widget while the target [image] is
/// loading, then fades in the new image when it loads.
///
/// This is similar to [FadeInImage] but the difference is that it allows you
/// to specify a widget as a [placeholder], instead of just an [ImageProvider].
/// It also lets you override the [child] argument, in case you want to wrap
/// the image with another widget, for example an [Ink.image].
class FadeInImagePlaceholder extends StatelessWidget {
  const FadeInImagePlaceholder({
    Key key,
    @required this.image,
    @required this.placeholder,
    this.child,
    this.duration = const Duration(milliseconds: 500),
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.fit,
  })  : assert(placeholder != null),
        assert(image != null),
        super(key: key);

  /// The target image that we are loading into memory.
  final ImageProvider image;

  /// Widget displayed while the target [image] is loading.
  final Widget placeholder;

  /// What widget you want to display instead of [placeholder] after [image] is
  /// loaded.
  ///
  /// Defaults to display the [image].
  final Widget child;

  /// The duration for how long the the fade out of the placeholder and
  /// fade in of [child] should take.
  final Duration duration;

  /// See [Image.excludeFromSemantics].
  final bool excludeFromSemantics;

  /// See [Image.width].
  final double width;

  /// See [Image.height].
  final double height;

  /// See [Image.fit].
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        // We only need to animate the loading of images on the web. We can
        // also return early if the images are already in the cache.
        if (wasSynchronouslyLoaded || !kIsWeb) {
          return this.child ?? child;
        } else {
          return AnimatedSwitcher(
            duration: duration,
            child: frame != null ? this.child ?? child : placeholder,
          );
        }
      },
    );
  }
}
