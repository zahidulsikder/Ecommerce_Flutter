import 'package:e_commerce/core/core.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/catalog.dart';
import 'package:e_commerce/util/route.dart';
import 'package:e_commerce/widget/home_page/catalog_header.dart';
import 'package:e_commerce/widget/home_page/catalog_list.dart';
import 'package:e_commerce/widget/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:velocity_x/velocity_x.dart";


class AddToCart extends StatelessWidget {

  final Item catalog;

  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;

    bool isInCart  = _cart?.items.contains(catalog) ?? false;


    return ElevatedButton(onPressed: (){
      if(!isInCart){
        AddMutation(catalog);
      }
    },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),

        child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

