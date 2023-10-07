import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/services/theme_notifier.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  _ThemeToggleState createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return ListTile(
      title: const Text('Dark Mode'),
      trailing: Switch(
        value: themeNotifier.isDarkMode,
        onChanged: (value) {
          setState(() {
            themeNotifier.toggleTheme();
          });
        },
      ),
    );
  }
}