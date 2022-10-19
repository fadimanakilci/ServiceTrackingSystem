import 'package:flutter/material.dart';
import 'package:terrasoft/helpers/color_helper.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class WidgetHelper{
  Widget space5Width(){
    return const SizedBox(
      width: 5,
    );
  }
  Widget space10Width(){
    return const SizedBox(
      width: 10,
    );
  }
  Widget space15Width(){
    return const SizedBox(
      width: 15,
    );
  }
  Widget space20Width(){
    return const SizedBox(
      width: 20,
    );
  }

  Widget space5Height(){
    return const SizedBox(
      height: 5,
    );
  }
  Widget space10Height(){
    return const SizedBox(
      height: 10,
    );
  }
  Widget space15Height(){
    return const SizedBox(
      height: 15,
    );
  }
  Widget space20Height(){
    return const SizedBox(
      height: 20,
    );
  }
  Widget space30Height(){
    return const SizedBox(
      height: 30,
    );
  }
  Widget space40Height(){
    return const SizedBox(
      height: 40,
    );
  }

  var buttonShadow = [
    BoxShadow(
        color: Colors.grey.shade400,
        blurRadius: 3,
        spreadRadius: 0.2,
        offset: const Offset(2, 2)
    ),
    BoxShadow(
        color: Colors.grey.shade100,
        blurRadius: 2,
        spreadRadius: 1,
        offset: const Offset(-1, -1)
    ),
  ];
  var blueShadow = const[
    BoxShadow(
        color: Color(0xff8ecafa),
        blurRadius: 3,
        spreadRadius: 0.2,
        offset: Offset(2, 2)
    ),
    BoxShadow(
        color: Colors.white,
        blurRadius: 2,
        spreadRadius: 1,
        offset: Offset(-1, -1)
    ),
  ];

  PreferredSizeWidget buildAppBar(String title){
    return AppBar(
      title: Text(
          title,
      ),
      leading: InkWell(
        // onTap: () => Get.back(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: buttonShadow,
              color: Colors.white
            ),
            child: const Icon(Icons.chevron_left, color: ColorHelper.grey, size: 28)),
        ),
      ),
    );
  }

  Widget buildCircularProgress(){
    return const Center(
      child: CircularProgressIndicator(
        color: ColorHelper.primary,
        backgroundColor: ColorHelper.secondary,
        strokeWidth: 3,
      ),
    );
  }

  Widget gradientButton(String text){
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: ColorHelper().blueGradient,
          borderRadius: BorderRadius.circular(8),
          boxShadow: blueShadow
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                fontSize: 14
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget darkButton(String text){
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorHelper.primaryDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                fontSize: 14
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget circularIcon(){
    return Stack(
      alignment: Alignment.center,
      children: const [
        SizedBox(
          width: 30,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: ColorHelper.lightGrey,
              shape: BoxShape.circle
            ),
          ),
        ),
        SizedBox(
          width: 10,
          height: 10,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: ColorHelper.grey,
                shape: BoxShape.circle
            ),
          ),
        ),
      ],
    );
  }
}