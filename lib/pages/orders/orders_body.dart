import 'package:cafe_app/constant/constant.dart';
import 'package:cafe_app/models/order_model.dart';
import 'package:cafe_app/pages/components/app_bar.dart';
import 'package:cafe_app/pages/orders/components/checkout_button.dart';
import 'package:cafe_app/providers/table.dart';
import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/coupons.dart';
import 'components/fees.dart';
import 'components/heading.dart';
import 'components/products.dart';

class OrdersBody extends StatefulWidget {
  @override
  _OrdersBodyState createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  List<OrderModel> orders = [];
  Map<String, double> feeMap = {};
  bool isloading = false;

  void startLoading() => setState(() => isloading = true);
  void stopLoading() => setState(() => isloading = false);

  Future<void> updateOrders() async {
    startLoading();
    TableProvider provider = Provider.of<TableProvider>(context, listen: false);
    if (provider.selectedTable?.customer == null) {
      return;
    }
    await provider.refreshOrders();
    setState(() {
      orders = provider.orders;
      orders.expand((order) => order.fees).fold(feeMap = {},
          (Map<String, double> previous, fee) {
        previous[fee.name] = previous.containsKey(fee.name)
            ? previous[fee.name] + fee.total
            : fee.total;
        return previous;
      });
      feeMap = feeMap;
    });
    stopLoading();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    updateOrders();
  }

  double getTotal() => orders.fold(0.0, (sum, order) => sum + order.total);

  @override
  Widget build(BuildContext context) {
    Widget body = isloading
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            child: ListView(
              // shrinkWrap: true,
              children: [
                HeadingItem('餐品'),
                ...buildProducts(context),
                HeadingItem('優惠'),
                ...buildCoupons(context),
                HeadingItem('其他'),
                ...buildFees(feeMap),
                Divider(),
                Row(
                  children: [
                    HeadingItem('總計'),
                    Spacer(),
                    HeadingItem(priceToString(getTotal())),
                  ],
                ),
              ],
            ),
            onRefresh: updateOrders,
          );
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        leading: IconButton(
          icon: Icon(Icons.event_seat),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: AnimatedSwitcher(
        duration: Duration.zero,
        child: body,
      ),
      floatingActionButton: CheckOutButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
