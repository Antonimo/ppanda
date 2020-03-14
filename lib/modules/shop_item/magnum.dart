import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/block_picker.dart';
import 'package:ppanda/services/shop_service.dart';

class Magnum extends StatefulWidget {
  final String itemId;

  Magnum(this.itemId);

  @override
  _MagnumState createState() => _MagnumState();
}

class _MagnumState extends State<Magnum> {
  ShopItem shopItem;

  List<ShopItemOption> options = [
    ShopItemOption(
      id: 'size',
      name: 'גודל',
      choices: [
        ShopItemOptionChoice(
          id: 'magnum_chocolage',
          name: 'רגיל',
        ),
        ShopItemOptionChoice(
          id: 'magnum_vanil',
          name: 'מיני',
        ),
      ],
    ),
    ShopItemOption(
      id: 'taste',
      name: 'טעם',
      choices: [
        ShopItemOptionChoice(
          id: 'magnum_mousse_white_chocolage',
          name: 'מוס שוקולד לבן',
        ),
        ShopItemOptionChoice(
          id: 'magnum_mousse_milk_chocolage',
          name: 'מוס שוקולד חלב',
        ),
        ShopItemOptionChoice(
          id: 'magnum_mousse_dark_chocolage',
          name: 'מוס שוקולד מריר',
        ),
        ShopItemOptionChoice(
          id: 'magnum_mousse_oreo',
          name: 'מוס אוראו',
        ),
        ShopItemOptionChoice(
          id: 'magnum_mousse_nutella',
          name: 'מוס נוטלה',
        ),
        ShopItemOptionChoice(
          id: 'magnum_mousse_kinder_bueno',
          name: 'מוס קינדר בואנו',
        ),
      ],
    ),
    ShopItemOption(
      id: 'coat',
      name: 'ציפוי',
      choices: [
        ShopItemOptionChoice(
          id: 'magnum_coat_white_chocolage',
          name: 'שוקולד לבן',
        ),
        ShopItemOptionChoice(
          id: 'magnum_coat_milk_chocolage',
          name: 'שוקולד חלב',
        ),
        ShopItemOptionChoice(
          id: 'magnum_coat_dark_chocolage',
          name: 'שוקולד מריר',
        ),
      ],
    ),
    ShopItemOption(
      id: 'color',
      name: 'צבע',
      type: 'color',
      condition: {
        'coat': 'magnum_coat_white_chocolage',
      },
    ),
  ];

  Map<String, dynamic> selectedOptions = {};

  int showOptionsItems = 1;

  @override
  void initState() {
    super.initState();

    shopItem = ShopService.items.firstWhere((item) {
      return item.id == widget.itemId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 232,
                  width: double.infinity,
                  child: Image(
                    image: shopItem.image,
                    fit: BoxFit.cover,
                  ),
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
                      Text(
                        shopItem.name,
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ...buildShopItemOptions(),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: RaisedButton(
                    onPressed: (){},
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                    child: Text(
                      'הזמן!',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildShopItemOptions() {
    List<Widget> optionsWidgets = [];

    int addedItems = 0;

    options.forEach((option) {

      if (addedItems >= showOptionsItems){
        return;
      }

      if (option.condition != null){
        // TODO: support multiple choices

        print('option.condition.keys.first: ${option.condition.keys.first}');
        print('selectedOptions[option.condition.keys.first]: ${selectedOptions[option.condition.keys.first]}');

        print('option.condition.values.first: ${option.condition.values.first}');

        if (selectedOptions[option.condition.keys.first] == null || selectedOptions[option.condition.keys.first] != option.condition.values.first){
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
        if ( selectedOptions[option.id] != null &&
            option.choices.where((ShopItemOptionChoice choice) {
              return choice.id == selectedOptions[option.id];
            }).length != 1
        ){
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
                if (selectedOptions[option.id] == null){
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
  }
}

bool useWhiteForeground(Color color, {double bias: 1.0}) {
  // Old:
  // return 1.05 / (color.computeLuminance() + 0.05) > 4.5;

  // New:
  bias ??= 1.0;
  int v = sqrt(pow(color.red, 2) * 0.299 + pow(color.green, 2) * 0.587 + pow(color.blue, 2) * 0.114).round();
  return v < 130 * bias ? true : false;
}
