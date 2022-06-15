
import 'package:get/get.dart';

class Message extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'title': 'Settings',
      'account':'Account',
      'account_sub1':'My Account',
      'account_sub2':'Account Security',
      'account_sub3':'Sign Out',
      'common':'Common',
      'common_sub1':'Language',
      'common_content1':'English',
      'common_sub2':'Bluetooth',
      'common_content2':'Connect the device with bluetooth',
      'common_sub3':'Wifi',
      'common_content3':'Connect the device with wifi',
      'common_sub4':'Environment',
      'common_content4':'Production',
      'security':'Security',
      'security_sub1':'Lock app in background',
      'security_sub2':'Use fingerprint',
      'security_sub3':'Change password',
      'security_sub4':'Enable Notifications',
      'misc':'Misc',
      'misc_sub1':'Terms of Service',
      'misc_sub2':'Open source licenses',
    },
    'zh-CN':{
      'title': '设置',
      'account':'账户',
      'account_sub1':'我的账号',
      'account_sub2':'账号安全',
      'account_sub3':'退出',
      'common':'普通',
      'common_sub1':'语言',
      'common_content1':'英语',
      'common_sub2':'蓝牙',
      'common_content2':'使用蓝牙连接设备',
      'common_sub3':'Wifi',
      'common_content3':'使用wifi连接设备',
      'common_sub4':'环境',
      'common_content4':'生产',
      'security':'安全',
      'security_sub1':'在后台锁定应用程序',
      'security_sub2':'使用指纹',
      'security_sub3':'修改密码',
      'security_sub4':'允许通知',
      'misc':'其它',
      'misc_sub1':'服务条款',
      'misc_sub2':'打开许可证',
    }
  };
}