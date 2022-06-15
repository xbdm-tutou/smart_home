
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


final appGradient = LinearGradient(
    colors: [
      Get.theme.primaryColor,
      Get.theme.colorScheme.secondary,
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
);