import 'package:cafe_app/models/cart_item.dart';
import 'package:cafe_app/models/menu_model.dart';
import 'package:cafe_app/pages/shopping_cart/shopping_cart.dart';
import 'package:cafe_app/providers/cart.dart';
import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/add_to_cart_button.dart';
import 'components/product_detail_body.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> selectedAttributes = [];
  double variationPrice;
  CartItem itemToAdd;

  void updateItem() {
    variationPrice =
        widget.product.getVariationByAttributes(selectedAttributes)?.price ??
            widget.product.price;

    itemToAdd = CartItem(
      productId: widget.product.id,
      variationId:
          widget.product.getVariationByAttributes(selectedAttributes)?.id,
      price: variationPrice,
    );
  }

  @override
  void initState() {
    selectedAttributes = widget.product.attributes
        .map((attribute) => attribute.defaultOption ?? attribute.options.first)
        .toList();

    updateItem();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Row(
            children: [
              Text(priceToString(context.watch<CartProvider>().totalCost)),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                tooltip: '購物車',
                onPressed: () {
                  ShoppingCartModal.show(
                    title: '購物車',
                    context: context,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: ProductDetailBody(
        product: widget.product,
        variationPrice: variationPrice,
        didSelected: ({index, selected}) {
          setState(() {
            selectedAttributes[index] = selected;
            updateItem();
          });
        },
      ),
      floatingActionButton: AddToCartButton(
        item: itemToAdd,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
