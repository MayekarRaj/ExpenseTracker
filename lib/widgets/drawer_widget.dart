import 'package:expense_tracker/controller/theme_mode_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    // final themeModeNotifier = Provider.of<ThemeModeNotifier>(context);

    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("All Expenses"),
            onTap: () {
              Navigator.pushNamed(context, '/allExpense');
            },
          ),
          ListTile(
            title: Text("Detailed View"),
            onTap: () {
              Navigator.pushNamed(context, '/details');
            },
          ),
          // ListTile(
          //   title: Text("Dark Mode"),
          //   trailing: SizedBox(
          //     height: 20,
          //     child: CupertinoSwitch(
          //       value: themeModeNotifier.themeMode == ThemeModeType.dark,
          //       onChanged: (newValue) {
          //         setState(() {
          //           themeModeNotifier.toggleThemeMode();
          //         });
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  //  void _setDarkModeTheme() {
  //   final ThemeData theme = ThemeData.dark();
  //   _updateTheme(theme);
  // }

  // void _setLightModeTheme() {
  //   final ThemeData theme = ThemeData.light();
  //   _updateTheme(theme);
  // }

  // void _updateTheme(ThemeData theme) {
  //   final MaterialApp app = context as MaterialApp;
  //   app.theme = theme;
  // }
}
