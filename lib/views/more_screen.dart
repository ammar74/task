
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/services/theme_notifier.dart';
import 'package:task/widgets/language_toggle.dart';
import 'package:task/widgets/theme_toggle.dart';

class MoreScreen extends StatelessWidget {
  final languageProvider = Provider.of<ThemeNotifier>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'More',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      centerTitle: true,

    ),
      body:  ListView(
        children:const [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding:  EdgeInsets.only(top: 16.0,left: 16.0),
              child:  Text(
                'Settings',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            LanguageToggle(),
            Divider(
              color: Colors.grey,
              indent: 45,
              endIndent: 45,
              thickness: 1,
              height: 10,
            ),
            ThemeToggle(),
          ],
        ),]
      ),
    );
  }
}