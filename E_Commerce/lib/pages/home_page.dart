import 'package:e_commerce/util/route.dart';
import 'package:e_commerce/widget/drawer.dart';
import 'package:e_commerce/pages/home_detail_page.dart';
import 'package:e_commerce/widget/home_widget/catalog_header.dart';
import 'package:e_commerce/widget/home_widget/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/catalog.dart';
import 'dart:convert';
import "package:velocity_x/velocity_x.dart";


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    //print(catalogJson);
    var decodeData = jsonDecode(catalogJson);
    //print(decodeData);
    var productsData = decodeData["products"];
    // print(productsData);
    CatalogModel.item = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // for check
    // final dummyList=List.generate(20, (index) => CatalogModel().items[0]);

    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.theme.buttonColor,

          onPressed: ()=>Navigator.pushNamed(context, MyRoute.cartRoute),
          child: Icon(
            CupertinoIcons.cart, color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Text("Hotel Rents"),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
                  CatalogList().p16().expand()
                else
                  CircularProgressIndicator().centered().py16().expand(),
              ],
            ),
          ),
        ));
  }
}

