
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirst/controllers/TemperatureController.dart';
import 'package:myfirst/utilities/app_assets.dart';
import 'package:myfirst/utilities/app_spaces.dart';
import 'package:myfirst/widgets/buttons.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TemperatureScreen extends StatelessWidget {
  const TemperatureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TemperatureController>(
        init: TemperatureController(),
        builder: (controller){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: Column(children: [
              TopSelectButton(),
              AppSpaces.vertical10,
              Container(
                height: (Get.width - 60) / 3,
                child: Obx(
                    () => Row(children: [
                      HomeButton(
                        image: AppAssets.temperature,
                        text: 'Temperature',
                        isSelected: controller.index.value == 0,
                        onTap: () => controller.index.value == 0,
                        unSelectedImageColor: Colors.black,
                        fontSize: 16,
                      ),
                      AppSpaces.horizontal10,
                      HomeButton(
                        image: AppAssets.light,
                        text: 'Lights',
                        isSelected: controller.index.value == 1,
                        onTap: () => controller.index.value == 1,
                        unSelectedImageColor: Colors.black,
                        fontSize: 16,
                      ),
                      AppSpaces.horizontal10,
                      HomeButton(
                        image: AppAssets.humidity,
                        text: 'Humidity',
                        isSelected: controller.index.value == 2,
                        onTap: () => controller.index.value == 2,
                        unSelectedImageColor: Colors.black,
                        fontSize: 16,
                      ),
                    ],)
                ),
              ),
              AppSpaces.vertical20,
              Text(
                'Today',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
              AppSpaces.vertical30,
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                        customColors: CustomSliderColors(
                          trackColor: Get.theme.disabledColor,
                          dotColor: Get.theme.disabledColor,
                          progressBarColor: Get.theme.primaryColor,
                        ),
                        startAngle: 130.0,
                        angleRange: 280.0,
                        size: Get.mediaQuery.size.height,
                        customWidths: CustomSliderWidths(progressBarWidth: 5,handlerSize: 10)
                      ),
                      min: 13,
                      max: 35,
                      initialValue: controller.temperature.value,
                      onChangeEnd: (_value) => controller.temperature.value = _value,
                      innerWidget: (percentage) => Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7.0,
                                  spreadRadius: 8.0,
                                )
                              ]
                            ),
                            child: Container(
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Get.theme.primaryColor,
                                  width: 1.0
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white
                              ),
                              child: Center(
                                child: Text(
                                  '${percentage.toStringAsFixed(0)}°C',
                                  style: TextStyle(
                                    fontSize: 15 + (22*683 / Get.mediaQuery.size.height),
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
            ],),
          );
        });
  }
}
