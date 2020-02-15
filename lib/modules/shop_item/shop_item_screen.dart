import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/block_picker.dart';
import 'package:ppanda/services/shop_service.dart';

class ShopItemScreen extends StatefulWidget {
  final String itemId;

  ShopItemScreen(this.itemId);

  @override
  _ShopItemScreenState createState() => _ShopItemScreenState();
}

class _ShopItemScreenState extends State<ShopItemScreen> {
  ShopItem shopItem;

  Map<String, dynamic> selectedOptions = {};

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16.0),
              Text(shopItem.name),
              const SizedBox(height: 16.0),
              ...buildShopItemOptions(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildShopItemOptions() {
    List<Widget> optionsWidgets = [];

    shopItem.options.forEach((option) {
      optionsWidgets.add(
        const SizedBox(height: 16.0),
      );

      optionsWidgets.add(
        Text(option.name),
      );

      optionsWidgets.add(
        const SizedBox(height: 16.0),
      );

      if (option.choices != null) {
        optionsWidgets.add(
          DropdownButton<String>(
            isExpanded: true,
            hint: Text('בחר'),
            value: selectedOptions[option.name],
            // TODO: id
            items: option.choices.map((ShopItemOptionChoice choice) {
              return DropdownMenuItem<String>(
                value: choice.id,
                child: Text(choice.name),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedOptions[option.name] = value;
              });
              print('value: $value');
            },
          ),
        );
      }

      if (option.type == 'color') {
        Color currentColor = Color(0xff443a49);

        optionsWidgets.add(
          Center(
            child: RaisedButton(
              elevation: 3.0,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select a color'),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor: currentColor,
                          onColorChanged: (Color color) {
                            setState(() {

                              selectedOptions[option.name] = color;
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
              color: selectedOptions[option.name] ?? currentColor,
              textColor: useWhiteForeground(selectedOptions[option.name] ?? currentColor) ? const Color(0xffffffff) : const Color(0xff000000),
            ),
          ),
        );
      }
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
  int v = sqrt(pow(color.red, 2) * 0.299 +
      pow(color.green, 2) * 0.587 +
      pow(color.blue, 2) * 0.114)
      .round();
  return v < 130 * bias ? true : false;
}