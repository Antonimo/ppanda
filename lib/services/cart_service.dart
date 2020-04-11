

import 'package:ppanda/services/shop_service.dart';

class CartService {
  static const TAG = '[CartService] ';

  CartService._privateConstructor();

  static final CartService _instance = CartService._privateConstructor();

  static CartService get instance {
    return _instance;
  }

  List<ShopItem> shopItems = [];
  Map<String, Map<String, dynamic>> selectedOptions = {};


  void updateCart(ShopItem shopItem, Map<String, dynamic> selectedOptions){
    shopItems.clear();

    shopItems.add(shopItem);
    this.selectedOptions[shopItem.id] = selectedOptions;
  }

}
