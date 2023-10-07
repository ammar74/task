import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/l10n/app_localizations.dart';
import 'package:task/services/language_notifier.dart';


class TopLikesSection extends StatefulWidget {
  const TopLikesSection({super.key});

  @override
  _TopLikesSectionState createState() => _TopLikesSectionState();
}

class _TopLikesSectionState extends State<TopLikesSection> {

/*
  final List<String> _titles = [
    'Flutter is awesome',
    'Dart is easy to learn',
    'MVVM is a good architecture'
  ];
  final List<String> _titlesArabic = [
    'فلاتر رائعة',
    'دارت سهلة التعلم',
    'MVVM هي بنية جيدة'
  ];*/
  final List<bool> _likes = [false, false, false];


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
        builder: (context, languageProvider, _) {
      final currentLanguage = languageProvider.currentLocale.languageCode;

      final List<String> englishList = ['Item 1', 'Item 2', 'Item 3'];
      final List<String> arabicList = ['بند 1', 'بند 2', 'بند 3'];

      final List<String> itemList =
      currentLanguage == 'en' ? englishList : arabicList;
      return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding:  const EdgeInsets.only(top: 16.0),
            child:  Text(
              AppLocalizations.of(context)!.topLikes,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:const EdgeInsets.only(top: 16.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itemList[index]),
                  trailing: IconButton(
                    icon: Icon(
                      _likes[index] ? Icons.favorite : Icons.favorite_border,
                      color: _likes[index] ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _likes[index] = !_likes[index];
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  });
  }
}