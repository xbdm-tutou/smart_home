import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:myfirst/screens/login_screen.dart';
import 'package:myfirst/screens/myprofile_screen.dart';
import 'package:settings_ui/settings_ui.dart';

import 'languages_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Settings')),
      appBar: AppBar(title: Text("title".tr)),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Account'),
          tiles: [
            SettingsTile(
              title: Text('My Account'),
              leading: Icon(Icons.account_circle),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => MyProfileScreen(),
                ));
              },
            ),
            SettingsTile(title: Text('Account Security'), leading: Icon(Icons.security)),
            SettingsTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.exit_to_app),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => LoginScreen(),
                ));
              },

            ),
          ],
        ),
        SettingsSection(
          title: Text('Common'),
          tiles: [
            SettingsTile(
              title: Text('Language'),
              value: Text('English'),
              leading: Icon(Icons.language),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => LanguagesScreen(),
                ));
              },
            ),
            SettingsTile(
              title: Text('Buletooth'),
              value: Text('Connect the device with bluetooth'),
              leading: Icon(Icons.bluetooth),
            ),
            SettingsTile(
              title: Text('Wifi'),
              value: Text('Connect the device with wifi'),
              leading: Icon(Icons.wifi),
            ),
            SettingsTile(
              title: Text('Environment'),
              value: Text('Production'),
              leading: Icon(Icons.cloud_queue),
            ),
          ],
        ),

        SettingsSection(
          title: Text('Security'),
          tiles: [
            SettingsTile.switchTile(
              title: Text('Lock app in background'),
              leading: Icon(Icons.phonelink_lock),
              initialValue: lockInBackground,
              onToggle: (bool value) {
                setState(() {
                  lockInBackground = value;
                  notificationsEnabled = value;
                });
              },
            ),
            SettingsTile.switchTile(
              title: Text('Use fingerprint'),
              // subtitle: Text('Allow application to access stored fingerprint IDs.'),
              leading: Icon(Icons.fingerprint),
              onToggle: (bool value) {},
              initialValue: false,

            ),
            SettingsTile.switchTile(
              title: Text('Change password'),
              leading: Icon(Icons.lock),
              initialValue: true,
              onToggle: (bool value) {},
            ),
            SettingsTile.switchTile(
              title: Text('Enable Notifications'),
              enabled: notificationsEnabled,
              leading: Icon(Icons.notifications_active),
              initialValue: true,
              onToggle: (value) {},
            ),
          ],
        ),
        SettingsSection(
          title: Text('Misc'),
          tiles: [
            SettingsTile(
                title: Text('Terms of Service'), leading: Icon(Icons.description)),
            SettingsTile(
                title: Text('Open source licenses'),
                leading: Icon(Icons.collections_bookmark)),
          ],
        ),
        CustomSettingsSection(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 8),
                child: Image.asset(
                  'asset/images/settings.png',
                  height: 50,
                  width: 50,
                  color: Color(0xFF777777),
                ),
              ),
              Text(
                'Version: 2.4.0 (287)',
                style: TextStyle(color: Color(0xFF777777)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
