import 'package:flutter/material.dart';
import 'package:ppanda/theme/images.dart';

class ShopService {
  static final items = [
    ShopItem(
      id: 'cakepop',
      name: 'קייקפופ',
      image: Images.item1,
      images: [
        Images.item1,
        Images.item13,
        Images.item27,
        Images.item28,
        Images.item34,
      ],
      options: [
        ShopItemOption(
          id: 'taste',
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
          id: 'cover',
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
          id: 'color',
          name: 'צבע',
          type: 'color',
          condition: {
            'cover': 'cakepop_coat_white_chocolate',
          },
        ),
      ],
    ),
    ShopItem(
      id: 'cupcake',
      name: 'קאפקייקס',
      image: Images.item3,
      images: [
        Images.item3,
        Images.item7,
        Images.item12,
        Images.item16,
        Images.item18,
        Images.item24,
        Images.item47,
        Images.item48,
        Images.item51,
      ],
      options: [
        ShopItemOption(
          id: 'taste',
          name: 'טעם',
          choices: [
            ShopItemOptionChoice(
              id: 'cupcake_chocolage',
              name: 'שוקולד',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_vanil',
              name: 'וניל',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_red_velvet',
              name: 'רד ולווט',
            ),
          ],
        ),
        ShopItemOption(
          id: 'filling',
          name: 'מילוי',
          condition: {
            'taste': 'cupcake_chocolage',
          },
          choices: [
            ShopItemOptionChoice(
              id: 'cupcake_filling_toffee',
              name: 'טופי',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_cherries',
              name: 'דובדבנים',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_raspberry_strawberry',
              name: 'פטל+תות',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_nutella',
              name: 'נוטלה',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_ferrero rocher',
              name: 'פררו רושה',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_kinder_bueno',
              name: 'קינדר בואנו',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_raffaello',
              name: 'רפאלו',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_salted_caramel',
              name: 'קרמל מלוח',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_none',
              name: 'ללא מילוי',
            ),
          ],
        ),
        ShopItemOption(
          id: 'filling',
          name: 'מילוי',
          condition: {
            'taste': 'cupcake_vanil',
          },
          choices: [
            ShopItemOptionChoice(
              id: 'cupcake_filling_toffee',
              name: 'טופי',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_raspberry_strawberry',
              name: 'פטל+תות',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_Mango_Passiflora',
              name: 'מנגו פסיפלורה',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_nutella',
              name: 'נוטלה',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_ferrero rocher',
              name: 'פררו רושה',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_kinder_bueno',
              name: 'קינדר בואנו',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_raffaello',
              name: 'רפאלו',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_none',
              name: 'ללא מילוי',
            ),
          ],
        ),
        ShopItemOption(
          id: 'filling',
          name: 'מילוי',
          condition: {
            'taste': 'cupcake_red_velvet',
          },
          choices: [
            ShopItemOptionChoice(
              id: 'cupcake_filling_raspberry_strawberry',
              name: 'פטל+תות',
            ),
            ShopItemOptionChoice(
              id: 'cupcake_filling_none',
              name: 'ללא מילוי',
            ),
          ],
        ),
        ShopItemOption(
          id: 'cover',
          name: 'ציפוי',
          choices: [
            ShopItemOptionChoice(
              id: 'cakepop_coat_cream_vanilla_mascarpone',
              name: 'קרם וניל מסקרפונה',
            ),
            ShopItemOptionChoice(
              id: 'cakepop_coat_cream_milk_chocolate',
              name: 'קרם שוקולד חלב',
            ),
            ShopItemOptionChoice(
              id: 'cakepop_coat_cream_dark_chocolate',
              name: 'קרם שוקולד מריר',
            ),
          ],
        ),
      ],
    ),
    ShopItem(
      id: 'mousse',
      name: 'קינוחי מוס אישיים',
      image: Images.item19,
      images: [
        Images.item19,
        Images.item20,
        Images.item22,
        Images.item31,
      ],
      options: [
        ShopItemOption(
          id: 'type',
          name: 'סוג',
          choices: [
            ShopItemOptionChoice(
              id: 'mousse_white_chocolate',
              name: 'מוס שוקולד לבן',
            ),
            ShopItemOptionChoice(
              id: 'mousse_milk_chocolate',
              name: 'מוס שוקולד חלב / מריר',
            ),
            ShopItemOptionChoice(
              id: 'mousse_coconut',
              name: 'מוס קוקוס',
            ),
            ShopItemOptionChoice(
              id: 'mousse_oreo',
              name: 'מוס אוראו',
            ),
          ],
        ),
        ShopItemOption(
          id: 'filling',
          name: 'מילוי',
          condition: {
            'type': 'mousse_white_chocolate',
          },
          choices: [
            ShopItemOptionChoice(
              id: 'mousse_filling_Mango_Passiflora',
              name: 'מנגו פסיפלורה',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_strawberry',
              name: 'תות',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_pineapple',
              name: 'אננס',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_mousse_milk_chocolate',
              name: 'מוס שוקולד חלב',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_מםמק',
              name: 'ללא',
            ),
          ],
        ),
        ShopItemOption(
          id: 'filling',
          name: 'מילוי',
          condition: {
            'type': 'mousse_milk_chocolate',
          },
          choices: [
            ShopItemOptionChoice(
              id: 'mousse_filling_Mango_Passiflora',
              name: 'מנגו פסיפלורה',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_raspberry',
              name: 'פטל',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_cherries',
              name: 'דובדבנים',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_raspberry_strawberry',
              name: 'פטל+תות',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_cherries',
              name: 'דובדבנים',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_mousse_milk_chocolate',
              name: 'מוס שוקולד חלב',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_מםמק',
              name: 'ללא',
            ),

          ],
        ),
        ShopItemOption(
          id: 'filling',
          name: 'מילוי',
          condition: {
            'type': 'mousse_coconut',
          },
          choices: [
            ShopItemOptionChoice(
              id: 'mousse_filling_Mango_Passiflora',
              name: 'מנגו פסיפלורה',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_pineapple',
              name: 'אננס',
            ),
            ShopItemOptionChoice(
              id: 'mousse_filling_almond_cream',
              name: 'קרם שקדים',
            ),
          ],
        ),
      ],
    ),
    ShopItem(
      id: 'magnum',
      name: 'מגנום',
      image: Images.item33,
      images: [
        Images.item33,
      ],
      options: [
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
      ],
    ),

    ShopItem(
      id: 'cup_dessert',
      name: 'קינוחי כוסות \ צנצנת',
      image: Images.item4,
      images: [
        Images.item4,
      ],
      options: [
        ShopItemOption(
          id: 'type',
          name: 'סוג',
          choices: [
            ShopItemOptionChoice(
              id: 'cup_dessert_Tricold',
              name: 'טריקולד',
            ),
            ShopItemOptionChoice(
              id: 'cup_dessert_Tiramisu',
              name: 'טירמיסו',
            ),
            ShopItemOptionChoice(
              id: 'cup_dessert_Red_Velvet_Raspberry_Strawberry',
              name: 'רד ולווט תות פטל',
            ),
            ShopItemOptionChoice(
              id: 'cup_dessert_White Chocolate Vanilla / Mango Passiflora',
              name: 'וניל שוקולד לבן / מנגו פסיפלורה',
            ),
          ],
        ),
      ],
    ),

    ShopItem(
      id: 'tarts',
      name: 'טארטים',
      image: Images.item4,
      images: [
        Images.item4,
      ],
      options: [
        ShopItemOption(
          id: 'type',
          name: 'סוג',
          choices: [
            ShopItemOptionChoice(
              id: 'cup_dessert_Tricold',
              name: 'טריקולד',
            ),
            ShopItemOptionChoice(
              id: 'cup_dessert_Tiramisu',
              name: 'טירמיסו',
            ),
            ShopItemOptionChoice(
              id: 'cup_dessert_Red_Velvet_Raspberry_Strawberry',
              name: 'רד ולווט תות פטל',
            ),
            ShopItemOptionChoice(
              id: 'cup_dessert_White Chocolate Vanilla / Mango Passiflora',
              name: 'וניל שוקולד לבן / מנגו פסיפלורה',
            ),
          ],
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
  final List<AssetImage> images;

  ShopItem({
    this.id,
    this.name,
    this.type,
    this.image,
    this.images,
    this.options,
  });
}

class ShopItemOption {
  final String id;
  final String name;
  final String type;
  final Map<String, String> condition;

  final List<ShopItemOptionChoice> choices;

  ShopItemOption({
    this.id,
    this.name,
    this.type,
    this.condition,
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
