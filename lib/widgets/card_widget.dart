import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:terrasoft/helpers/color_helper.dart';
import 'package:terrasoft/helpers/widget_helper.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String subtitle4;
  final String data1;
  final String data2;
  final String data3;
  final String data4;
  final String? image;
  const CardWidget({
    Key? key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.data1,
    required this.data2,
    required this.data3,
    required this.data4,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: ColorHelper.primaryDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3
                ),
              ),
              WidgetHelper().space10Height(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle1,
                    style: const TextStyle(
                        color: ColorHelper.grey,
                        fontSize: 15,
                    ),
                  ),
                  WidgetHelper().space5Width(),
                  Expanded(
                    child: Text(
                      data1,
                      style: const TextStyle(
                          color: ColorHelper.primaryDark,
                          fontSize: 15,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              WidgetHelper().space10Height(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle2,
                    style: const TextStyle(
                        color: ColorHelper.grey,
                        fontSize: 15,
                    ),
                  ),
                  WidgetHelper().space5Width(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        image != null ? Container(
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.only(right: 8),
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(image!)
                                )
                              )
                          ),
                        ) : const SizedBox(),
                        Text(
                          data2,
                          style: const TextStyle(
                              color: ColorHelper.primaryDark,
                              fontSize: 15,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              WidgetHelper().space10Height(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle3,
                    style: const TextStyle(
                        color: ColorHelper.grey,
                        fontSize: 15,
                    ),
                  ),
                  WidgetHelper().space5Width(),
                  Expanded(
                    child: Text(
                      data3,
                      style: const TextStyle(
                          color: ColorHelper.primaryDark,
                          fontSize: 15,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              WidgetHelper().space10Height(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle4,
                    style: const TextStyle(
                        color: ColorHelper.grey,
                        fontSize: 15,
                    ),
                  ),
                  WidgetHelper().space5Width(),
                  Expanded(
                    child: Text(
                      data4,
                      style: const TextStyle(
                          color: ColorHelper.primaryDark,
                          fontSize: 15,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              WidgetHelper().space10Height(),
            ],
          ),
        ),
      ),
    );
  }
}
