
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfirst/net/URL.dart';
import 'package:myfirst/utilities/constant.dart';
import 'package:myfirst/screens/login_screen.dart';
import 'package:myfirst/utilities/toast.dart';

import 'bottomnav_screen.dart';
import 'myprofile_screen.dart';


class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  String username = "";
  String password = "";
  String email = "";
  String token = "";
  TextEditingController _usernameEditController = new TextEditingController();
  TextEditingController _emailEditController = new TextEditingController();
  TextEditingController _tokenController = new TextEditingController();
  TextEditingController _passwordEditController = new TextEditingController();
  TextEditingController _passwordConfirmEditController = new TextEditingController();


  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLableStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            // keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              hintText: 'Enter your username',
              hintStyle: kHintTextStyle,
            ),
            controller: _usernameEditController,
          ),
        ),
      ],
    );
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
            // keyboardType: TextInputType.emailAddress,
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
            controller: _passwordEditController,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordConfirmTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: kLableStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.password,
                color: Colors.white,
              ),
              hintText: 'Enter your Password again',
              hintStyle: kHintTextStyle,
            ),
            controller: _passwordConfirmEditController,
          ),
        ),
      ],
    );
  }

  Widget _buildSendCodeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Code',
          style: kLableStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.verified,
                      color: Colors.white,
                    ),
                    hintText: 'Enter token',
                    hintStyle: kHintTextStyle,
                  ),
                  controller: _tokenController,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                // onTap: () => print('Send Button Pressed'),
                onTap: () => {
                  send(),
                  Toast.showToast("Try to send code!")
                },
                child: Container(
                  height: 40.0,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2.0,
                            offset: Offset(1.0,3.0)
                        )
                      ]
                  ),
                  width: 120,
                  child: Center(
                    child: Text(
                      'SEND',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 1.2,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),

                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSignupBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        // onPressed: () => print('Signup Button Pressed'),
        onPressed: () => handleSubmit(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'SIGN UP',
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



  Widget _buildLoginBtn() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, LoginScreen.id),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Login',
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
                    vertical: 90.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildUsernameTF(),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildSendCodeTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordConfirmTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildSignupBtn(),
                      _buildLoginBtn(),
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


  //注册
  void handleSubmit() async {
    username = _usernameEditController.text;
    email = _emailEditController.text;
    password = _passwordEditController.text;
    if(!(_passwordConfirmEditController.text == password)){
      return Toast.showToast("Password is invalid!");
    }
    String loginURL = baseURL+'/user/register';
    Dio dio = new Dio();

    var response = await dio.post(
        loginURL+"?token="+token,
        data: {'email': email, 'password': password,"username":username}
    );

    print('Response ${response.statusCode}');
    print(response.data);


    if (response.statusCode == 200) {
      Toast.showToast(response.data);

      if(response.data=="success"){
        Navigator.pushNamed(context, BottomNavigationScreen.id);
      }
    }
    else{
      Toast.showToast("Server or network error!");
    }
  }


  //发生验证码
  void send() async {
    username = _usernameEditController.text;
    email = _emailEditController.text;
    password = _passwordEditController.text;

    String sendURL = baseURL+"/user/send";
    Dio dio = new Dio();
    print("username:"+username);
    var response = await dio.post(
        sendURL,
        data: {'email': email, 'password': password,"username":username}
    );
    print('Response ${response.statusCode}');
    print(response.data);
    //成功发生送验证码
    if (response.statusCode == 200) {
      Toast.showToast(response.data);
      token=response.data.toString();
    }
    else{
      Toast.showToast("Server or network error!");
    }
  }
}
