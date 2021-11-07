import 'package:ecommerce/core/view_model/checkOut_viewModel.dart';
import 'package:ecommerce/view/checkout/summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

import '../../constance.dart';
import 'add_address_widget.dart';
import 'delevery_time_widget.dart';

class checkOutView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (contrroler)=>Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "CheckOut",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100,
            child: StatusChange.tileBuilder(
              theme: StatusChangeThemeData(
                direction: Axis.horizontal,
                connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
              ),
              builder: StatusChangeTileBuilder.connected(
                itemWidth: (_) =>
                MediaQuery.of(context).size.width / _processes.length,
                nameWidgetBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      _processes[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: contrroler.getColor(index),
                      ),
                    ),
                  );
                },
                indicatorWidgetBuilder: (_, index) {
                  if (index <= contrroler.index) {
                    return DotIndicator(
                      size: 35.0,
                      border: Border.all(color: Colors.green, width: 1),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return OutlinedDotIndicator(
                      size: 30,
                      borderWidth: 1.0,
                      color: todoColor,
                    );
                  }
                },
                lineWidgetBuilder: (index) {
                  if (index > 0) {
                    if (index == contrroler.index) {
                      final prevColor = contrroler.getColor(index - 1);
                      final color = contrroler.getColor(index);
                      var gradientColors;
                      gradientColors = [
                        prevColor,
                        Color.lerp(prevColor, color, 0.5)
                      ];
                      return DecoratedLineConnector(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                          ),
                        ),
                      );
                    } else {
                      return SolidLineConnector(
                        color: contrroler.getColor(index),
                      );
                    }
                  } else {
                    return null;
                  }
                },
                itemCount: _processes.length,
              ),
            ),
          ),
          contrroler.pages == Pages.DeliveryTime
              ? DeliveryTime()
              : contrroler.pages == Pages.AddAddress
              ? AddAddress()
              : Summary()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () {
            contrroler.changeIndex(contrroler.index+1);
        },
        backgroundColor: inProgressColor,
      ),
    ));
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];
