import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polres/light_theme.dart';
import 'package:polres/main.dart';
import 'package:polres/provider/app_theme_provider.dart';
import 'package:polres/utils/app.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polres/login_page.dart'; // Ganti your_app dengan path yang sesuai

class SettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
      routes: {
        LoginPage.routeLogin: (context) => LoginPage(),
      },
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkModeEnabled = false;

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkModeEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: isDarkModeEnabled,
                onChanged: toggleDarkMode,
              ),
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.routeLogin);
              },
            ),
          ],
        ),
      ),
    );
  }
}
