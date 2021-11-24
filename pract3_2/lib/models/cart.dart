import 'package:flutter/foundation.dart';
import 'package:pract3_2/models/catalog.dart';

class CartItem {
  late int count;

  late int discount;

  late Item item;

  CartItem(this.item, this.count, {this.discount = 0});

}

class CartModel extends ChangeNotifier {
  /// The private field backing [catalog].
  late CatalogModel _catalog;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<CartItem> _items = [];

  /// The current catalog. Used to construct items from numeric ids.
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  /// List of items in the cart.
  List<CartItem> get items => _items;

  /// The current total price of all items.
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.item.price * current.count);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _items.add(CartItem(item, 1));
    notifyListeners();
  }

  void remove(CartItem item) {
    _items.removeWhere((element) => element.item.id == item.item.id);
    notifyListeners();
  }

  void setCount(CartItem item, int count) {
    _items.where((element) => element.item.id == item.item.id).first.count = count;
    notifyListeners();
  }
}
