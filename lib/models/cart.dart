import 'package:practise1/core/store.dart';
import 'package:practise1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

// colllection of ids
  final List<int> _itemdIids = [];
// get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  List<Item> get items => _itemdIids.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

// add item
  // void add(Item item) {
  //   _itemdIids.add(item.id);
  // }

  // remove item
  // void remove(Item item) {
  //   _itemdIids.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemdIids.add(item.id);
    // TODO: implement perform
    throw UnimplementedError();
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemdIids.remove(item.id);
    // TODO: implement perform
    throw UnimplementedError();
  }
}
