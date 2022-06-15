import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluwx/fluwx.dart';
import 'package:get/get.dart';
import 'package:myfirst/screens/forgetpwd_screen.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:myfirst/screens/login_screen.dart';
import 'package:myfirst/screens/myprofile_screen.dart';
import 'package:myfirst/screens/signup_screen.dart';
import 'package:myfirst/screens/bottomnav_screen.dart';

import 'net/Message.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
/*配置微信登录
  static void initWeChatLogin() async{
    registerWxApi(
      appId: "appId",
      doOnAndroid: true,
      doOnIOS: true,
      universalLink: ""
    );
  }
*/




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      /*配置语言切换*/
      locale: Locale("en","US"),
      translations: Message(),
      fallbackLocale: Locale("en","US"),


      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff3B8AE4),
        backgroundColor: Color(0xfff0f0f0),
        disabledColor: Color(0xffededed),
        colorScheme: ColorScheme.fromSwatch(accentColor: Color(0xff3E7FC9)),
        // textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.id:(context) => LoginScreen(),
        SignupScreen.id:(context) => SignupScreen(),
        ForgetpwdScreen.id:(context) => ForgetpwdScreen(),
        BottomNavigationScreen.id:(context) => const BottomNavigationScreen(),
        MyProfileScreen.id:(context) => MyProfileScreen(),
      },
    );
  }
}