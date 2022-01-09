import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/theme.dart';

class ChangeThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        activeColor: MainColor.primaryColor,
        inactiveThumbImage: AssetImage('assets/images/sun.png'),
        activeThumbImage: AssetImage('assets/images/moon.png'),
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
        });
  }
}
