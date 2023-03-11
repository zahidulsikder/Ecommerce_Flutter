import 'package:e_commerce/core/core.dart';
import 'package:e_commerce/models/catalog.dart';
import 'package:e_commerce/widget/themes.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";


class CartModel {

  late CatalogModel _catalog;

  late final List<int> _itemIds;

  CatalogModel get catalogModel => _catalog;

  set catalogModel(CatalogModel value) {
    assert(value != null);
    _catalog = value;
  }
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

    num get totalPrice =>
        items.fold(0, (total, current) => total + current.price);

    void add(Item item){
      _itemIds.add(item.id);
    }

    void remove(Item item){
      _itemIds.remove(item.id);
    }
}

class AddMutation extends VxMutation<MyStore> {

  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    // TODO: implement perform
    store?.cart?._itemIds.add(item.id);
  }

}


class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store?.cart?._itemIds.remove(item.id);
  }





}

