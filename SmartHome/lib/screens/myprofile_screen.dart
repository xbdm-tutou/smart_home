import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myfirst/net/URL.dart';
import 'package:myfirst/utilities/check.dart';
import 'package:myfirst/utilities/toast.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileScreen extends StatefulWidget {
  static final String id = 'myprofile_screen';

  @override
  MyProfileScreenState createState() {
    return MyProfileScreenState();
  }
}

class MyProfileScreenState extends State<MyProfileScreen> {
  bool _status = true;
  late String _asURL = '';
  late XFile _image;
  String email = "1917964505@qq.com";


  final FocusNode myFocusNode = FocusNode();
  final TextEditingController _emailEditController=new TextEditingController();
  final TextEditingController _usernameEditController=new TextEditingController();
  final TextEditingController _nameEditController=new TextEditingController();
  final TextEditingController _telephoneEditController=new TextEditingController();
  final TextEditingController _ageEditController=new TextEditingController();
  final TextEditingController _jobEditController=new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    findByEmail();
    super.initState();
  }

  @override
  void dispose() {
    // 销毁组件,释放内存
    myFocusNode.dispose();
    _emailEditController.dispose();
    _usernameEditController.dispose();
    _nameEditController.dispose();
    _telephoneEditController.dispose();
    _ageEditController.dispose();
    _jobEditController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          color: Color(0xfff0f0f0),
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    height: 250.0,
                    color: Color(0xfff0f0f0),
                    child: new Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 20.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Icon(
                                  Icons.emoji_people,
                                  color: Color(0xff97DFE4),
                                  size: 22.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                  child: new Text('PROFILE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          fontFamily: 'sans-serif-light',
                                          color: Color(0xff84B8FB)
                                      )),
                                )
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: new Stack(fit: StackFit.loose, children: <Widget>[
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        // image: new NetworkImage(_asURL == '' ? defaultAsURL:_asURL),
                                        image: new NetworkImage(defaultAsURL),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 90.0, right: 100.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    _getAsEditIcon(),
                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Parsonal Information',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status ? _getEditIcon() : new Container(),
                                    ],
                                  )
                                ],
                              )),

                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'E-mail',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: const InputDecoration(hintText: "Enter E-mail ID"),
                                      controller: _emailEditController,
                                      onChanged: (value) {
                                        print("inputEmail: " + value);
                                      },
                                      enabled: false,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Username',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: const InputDecoration(
                                        hintText: "Enter Your Username",
                                      ),
                                      controller: _usernameEditController,
                                      onChanged: (value) {
                                        print("inputUsername: " + value);
                                      },
                                      enabled: !_status,
                                      autofocus: !_status,

                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Name',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Your Name"),
                                      enabled: !_status,
                                      controller: _nameEditController,
                                      onChanged: (value) {
                                        print("inputName: " + value);
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Mobile',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Mobile Number"),
                                      enabled: !_status,
                                      controller: _telephoneEditController,
                                      onChanged: (value) {
                                        print("inputTel: " + value);
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: new Text(
                                        'Age',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: new Text(
                                        'Job',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: new TextField(
                                        decoration: const InputDecoration(
                                            hintText: "Enter Age"),
                                        enabled: !_status,
                                        controller: _ageEditController,
                                        onChanged: (value) {
                                          print("inputAge: " + value);
                                        },
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Flexible(
                                    child: new TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Job"),
                                      enabled: !_status,
                                      controller: _jobEditController,
                                      onChanged: (value) {
                                        print("inputJob: " + value);
                                      },
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          !_status ? _getActionButtons() : new Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }


  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Color(0xff4C6FFF),
                    onPressed: () {
                      //补充资料校验
                      if(!isMobile(_telephoneEditController.text)){
                        Toast.showToast("Please input correct telephone number");
                      }
                      else if(!isAge(_ageEditController.text)){
                        Toast.showToast("Please input correct age");
                      }
                      else {
                        update(); //更新
                        setState(() {
                          _status = true;
                          FocusScope.of(context).requestFocus(new FocusNode());
                        });
                        initState();
                      }
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  Widget _getAsEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.redAccent,
        radius: 20.0,
        child: new Icon(
          Icons.camera_alt,
          color: Colors.white,
          size: 18.0,
        ),
      ),
      onTap: () {
        getImage();
        // setState(() {
        //   _status = false;
        // });
      },
    );
  }

  //获取数据
  Future<List?> findByEmail() async {
    print(email);
    String findUrl = baseURL+'/profile/findByEmail?email='+email;
    Dio dio = new Dio();

    var response = await dio.get(findUrl);

    print('Response ${response.statusCode}');
    print(response.data);

    if (response.statusCode == 200) {
      Toast.showToast("success");
      _emailEditController.text = response.data["email"];
      _usernameEditController.text = response.data["username"];
      _nameEditController.text = response.data["name"];
      _telephoneEditController.text = response.data["telephone"];
      _ageEditController.text =
      (response.data["age"] == null) ? "" : response.data["age"].toString();
      _jobEditController.text = response.data["job"];
      setState(() {
        _asURL = response.data["path"];
      });
    }
    else{
      Toast.showToast("Server or network error!");
    }
  }

  //修改
  void update() async {
    String loginURL = baseURL+'/profile/update';
    Dio dio = new Dio();
    var response = await dio.post(
        loginURL,
        data: {
          "email":_emailEditController.text,
          "username":_usernameEditController.text,
          "name":_nameEditController.text,
          "telephone":_telephoneEditController.text,
          "age":int.parse(_ageEditController.text),//转成int
          "job":_jobEditController.text
        });

    print('Response ${response.statusCode}');
    print(response.data);

    if (response.statusCode == 200) {
      Toast.showToast(response.data);
    }
    else{
      Toast.showToast("Server or network error!");
      //试图重新获取数据以刷新页面
      findByEmail();
    }
  }

  //获取图片并上传
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image == null) return;
    _upLoadImage(image);//上传图片
    findByEmail();
    setState(() {
      _image = image;
    });
  }


  //上传图片
  void _upLoadImage(XFile image) async {
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);

    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(path, filename:name)
    });

    Dio dio = new Dio();
    var response = await dio.post<String>(baseURL+"/image/update?email="+email, data: formdata);
    if (response.statusCode == 200) {
      Toast.showToast('Image upload successfully');
      initState();
    }
  }

}