import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceadmin/pages/prices/controllers/controller.dart';
import 'package:spaceadmin/pages/prices/widgets/form.dart';
import 'package:spaceadmin/widgets/appbar.dart';

import 'widgets/price.dart';

class PricesPage extends StatefulWidget {
  const PricesPage({Key? key}) : super(key: key);

  @override
  _PricesPageState createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        key: GlobalKey(),
        slivers: [
          const WAppBar(title: 'Edit prices'),
          const PriceForm(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 27,
              horizontal: 33,
            ),
            sliver: Obx(
              () => PricesController.to.prices.isEmpty
                  ? const SliverToBoxAdapter(
                      child: Text(
                        'No prices.',
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (ctx, i) => PriceItemWidget(
                          index: i + 1,
                          key: GlobalKey(),
                          price: PricesController.to.prices[i],
                        ),
                        childCount: PricesController.to.prices.length,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
