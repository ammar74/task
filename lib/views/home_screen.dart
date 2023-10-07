import 'package:flutter/material.dart';
import 'package:task/widgets/listen_audio.dart';
import 'package:task/widgets/top_likes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
            'This is App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [Column(
          children: [
            TopLikesSection(),
            Divider(
              color: Colors.grey,
              indent: 45,
              endIndent: 45,
              thickness: 1,
              height: 10,
            ),
            ListenAudiosSection(),
          ],
        ),]
      ),
    );
  }
}