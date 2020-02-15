import 'package:flutter/material.dart';
import 'package:ppanda/theme/images.dart';

class ShopService {
  static final items = [
    ShopItem(
      id: 'cakepop',
      name: 'קייקפופ',
      type: 'cakepop',
      image: Images.item1,
      options: [
        ShopItemOption(
          name: 'טעם',
          choices: [
            ShopItemOptionChoice(
              id: 'cakepop_chocolage',
              name: 'שוקולד',
            ),
            ShopItemOptionChoice(
              id: 'cakepop_vanil',
              name: 'וניל',
            ),
          ],
        ),
        ShopItemOption(
          name: 'ציפוי',
          choices: [
            ShopItemOptionChoice(
              id: 'cakepop_coat_dark_chocolate',
              name: 'שוקולד מריר',
            ),
            ShopItemOptionChoice(
              id: 'cakepop_coat_milk_chocolate',
              name: 'שוקולד חלב',
            ),
            ShopItemOptionChoice(
              id: 'cakepop_coat_white_chocolate',
              name: 'שוקולד לבן',
            ),
            ShopItemOptionChoice(
              id: 'cakepop_coat_ferrero_rocher',
              name: 'פררו רושה',
            ),
          ],
        ),
        ShopItemOption(
          name: 'צבע',
          type: 'color',
        ),
      ],
    ),
  ];
}

class ShopItem {
  final String id;
  final String name;
  final String type;

  final AssetImage image;

  final List<ShopItemOption> options;

  ShopItem({
    this.id,
    this.name,
    this.type,
    this.image,
    this.options,
  });
}

class ShopItemOption {
  final String name;
  final String type;

  final List<ShopItemOptionChoice> choices;

  ShopItemOption({
    this.name,
    this.type,
    this.choices,
  });
}

class ShopItemOptionChoice {
  final String id;
  final String name;

  ShopItemOptionChoice({
    this.id,
    this.name,
  });
}
