import 'package:ecommerce/constance.dart';
import 'package:ecommerce/enum.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [SizedBox(
          height: 50,
        ),
          RadioListTile<Delivery>(
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            activeColor: primaryColor,
            title: CustomText(
              text: 'StandardDelivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\norder will be delivery between 3-5 business days',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            activeColor: primaryColor,
            title: CustomText(
              text: 'Next Day Delivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\nlace your order before 6pm and your items will be delivered thew next days   ',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(
            value: Delivery.Nominated,
            groupValue: delivery,
            onChanged: (Delivery value) {
              setState(() {
                delivery = value;
              });
            },
            activeColor: primaryColor,
            title: CustomText(
              text: 'StandardDelivery',
              fontSize: 24,
            ),
            subtitle: CustomText(
              text: '\npick particular data from the calnendar and order will be delivery on selected  date',
            ),
          ),
        ],
      ),
    );
  }
}
