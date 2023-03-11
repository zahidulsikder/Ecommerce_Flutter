import 'package:e_commerce/core/core.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: context.canvasColor,
    appBar: AppBar(
      title: "Cart".text.xl.bold.make(),
      backgroundColor: Colors.transparent,
    ),
      body: Column(
        children: [
          _CartList(),
          Divider(),
          _CartTotal()
        ],
      )
    );
  }
}


class _CartList extends StatelessWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;  //********** If Error Than Slove this line

    return _cart!.items.isEmpty ? "Nothing to Show".text.make() : ListView.builder(
      itemCount: _cart?.items.length,
        itemBuilder: (context, index) => ListTile(

          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: (){
              RemoveMutation(_cart!.items[index]);
    },
    ),
    title: _cart?.items[index].name.text.make(),
    )


    );

  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final CartModel? _cart = (VxState.store as MyStore).cart;  //********** If Error Than Slove this line

    return SizedBox(
      height: 200,
      child: Row(
        children: [
          VxBuilder<MyStore>(
            mutations: {RemoveMutation},
              builder: (context, store, status){
                return "\$ ${_cart?.totalPrice}"
                    .text
                    .xl5
                    .make();
              },
          ),
          30.widthBox,
          ElevatedButton(
              onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: "Buying not Supported Yet".text.make()
              )
            );
          },

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)
          ),

              child: "Buy".text.white.make(),
          ).w32(context),


        ],
      ),
    );



    return const Placeholder();
  }
}














