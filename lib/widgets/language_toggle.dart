import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/services/language_notifier.dart';


class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  _LanguageToggleState createState() => _LanguageToggleState();
}


class _LanguageToggleState extends State<LanguageToggle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return ListTile(
      title: const Text('Arabic Language'),
      trailing: Switch(
        value: languageProvider.currentLocale.languageCode == 'ar',
        onChanged: (value) {
          setState(() {
            final newLocale = value ? Locale('ar') : Locale('en');
            languageProvider.changeLanguage(newLocale);
          });
        },
      ),
    );
  }
}
