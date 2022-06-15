
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:myfirst/net/URL.dart';
import 'package:myfirst/screens/signup_screen.dart';
import 'package:myfirst/utilities/constant.dart';
import 'package:myfirst/utilities/log_utils.dart';
import 'package:myfirst/utilities/toast.dart';

import 'bottomnav_screen.dart';
import 'forgetpwd_screen.dart';



class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  //密码输入焦点控制
  FocusNode _passwordFocusNode = new FocusNode();

  //邮箱输入框焦点控制
  FocusNode _emailFocusNode = new FocusNode();

  //密码输入控制器
  final TextEditingController _passwordEditController = new TextEditingController();

  //邮箱输入控制器
  final TextEditingController _emailEditController = new TextEditingController();

  //账户和密码
  String email="";
  String password = "";

  //微信登录
  @override
  void initState(){
    super.initState();

    fluwx.weChatResponseEventHandler.distinct((a, b) => a == b).listen((res) {
      if (res is fluwx.WeChatAuthResponse) {
        int errCode = res.errCode;
        // MyLogUtil.d('微信登录返回值：ErrCode :$errCode  code:${res.code}');
        if (errCode == 0) {
          String? code = res.code;
          //把微信登录返回的code传给后台
          // _presenter.getWeChatAccessToken(code);
          Toast.showToast("用户同意授权成功");
        } else if (errCode == -4) {
          Toast.showToast("用户拒绝授权");
        } else if (errCode == -2) {
          Toast.showToast("用户取消授权");
        }
      }
    });
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLableStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onSubmitted: (value){
              if(value.length != 11){
                Toast.showToast("Please input correct email number!");
                FocusScope.of(context).requestFocus(_emailFocusNode);
                return;
              }
            },
            // keyboardType: TextInputType.phoneAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your e-mail',
              hintStyle: kHintTextStyle,
            ),
            focusNode: _emailFocusNode,
            controller: _emailEditController,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLableStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onSubmitted: (value){
              if(value.length < 6) {
                Toast.showToast("The length of password must be more than 6 number");
                FocusScope.of(context).requestFocus(_passwordFocusNode);
                return;
              }
              _emailFocusNode.unfocus();
              _passwordFocusNode.unfocus();
            },
            focusNode: _passwordFocusNode,
            controller: _passwordEditController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        // onPressed: () => print('Forgot Password Button Pressed'),
        onPressed: () => Navigator.pushNamed(context, ForgetpwdScreen.id),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLableStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLableStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.pushNamed(context, BottomNavigationScreen.id),
        // onPressed: (){
        //   LogUtils.e("Login Button Has Been Pressed");
        //   submitHandle();
        // },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLableStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function() onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with WeChat'),

            AssetImage(
              'asset/logos/weixin.png',
            ),
          ),
          _buildSocialBtn(
                () => print('Login with QQ'),
            AssetImage(
              'asset/logos/qq.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, SignupScreen.id),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitHandle() async {

    email = _emailEditController.text;
    password = _passwordEditController.text;

    String loginURL = baseURL+'/user/login';
    Dio dio = new Dio();

    var response = await dio.post(
        loginURL,
        data: {'email': email, 'password': password}
    );
    print('Response ${response.statusCode}');
    print(response.data);

    if (response.statusCode == 200) {//状态码200 请求是成功的
      Toast.showToast(response.data);
      if(response.data=="success"){
        Navigator.pushNamed(context, BottomNavigationScreen.id);
      }
    }
    else{
      Toast.showToast("Server or network error!");
    }
  }
}
