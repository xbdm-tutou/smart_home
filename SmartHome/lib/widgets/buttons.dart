import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirst/utilities/app_assets.dart';
import 'package:myfirst/utilities/app_spaces.dart';
import 'package:myfirst/utilities/others.dart';

class TopSelectButton extends StatelessWidget {
  const TopSelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        items: [
          DropdownMenuItem(
            child: Text('All Rooms'),
            value: 'All Rooms',
          ),
          DropdownMenuItem(
            child: Text('Living Rooms'),
            value: 'Living Rooms',
          ),
        ],
        hint: Text(
          'Living Room',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ),
        ),
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.black
        ),
        icon: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(CupertinoIcons.chevron_down),
        ),
        iconSize: 20.0,
        iconEnabledColor: Colors.black,
        underline: SizedBox.shrink(),
        onChanged: (value){},
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
    required this.image,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.fontSize = 18.0,
    this.unSelectedImageColor,

  }) : super(key: key);

  final String image;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? unSelectedImageColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: isSelected ? appGradient:null,
              color: !isSelected ? Get.theme.backgroundColor:null,
            ),
            child: Column(children: [
              AppSpaces.vertical15,
              Expanded(
                child: Center(
                  child: Container(
                    width: Get.width / 5,
                    height: Get.height / 5,
                    child: Image.asset(
                      image,
                      color: isSelected ? Colors.white : (unSelectedImageColor ?? Get.theme.primaryColor),
                    ),
                  ),
                ),
              ),
              AppSpaces.vertical15,
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white :Colors.black,
                  fontSize: fontSize,
                ),
              ),
              AppSpaces.vertical15,
            ],),
          ),
        )
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: appGradient
        ),
        padding: EdgeInsets.all(9.0),
        child: Image.asset(
          AppAssets.onOff,
          width: 25.0,
          height: 25.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onTaop,
  }) : super(key: key);

  final String text;
  final VoidCallback onTaop;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaop,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          gradient: appGradient,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.0,vertical: 10.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w200
            ),
          ),
        ),
      ),
    );
  }
}

