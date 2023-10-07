import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:just_audio/just_audio.dart';
import 'package:task/models/audio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';


class AudioRepository {
  // Create a dio instance
  final dio = Dio();
  List<AudioFile> audioList = [];



// Define the API endpoint
  final String apiUrl = 'https://api.quran.com/api/v4/chapter_recitations/1/1';

  Future<List<AudioFile>> fetchAudioFiles() async {
    try{
      // Send a GET request to the API endpoint
      var response = await dio.get(apiUrl);
      // Parse the response data as a JSON object
      Map<String, dynamic> jsonData = response.data;
      print('JsonData $jsonData');
      // Extract the list of audio files from the data
      List<dynamic> audioFiles = jsonData.values.toList();
      print('the audioFiles is $audioFiles');

      //convert List<Map> to List<Object>
      for (var audio in audioFiles) {
       AudioFile audioFile= AudioFile(
                id: audio['id'],
                audioUrl: audio['audio_url']
            );
        audioList.add(audioFile);
        print('audioList inside the loop ${audioList}');

      }
      print('audioList after the loop $audioList');

      // Return the list of AudioFile instances
      return audioList;

    }catch (e) {
      print(e);
      throw Exception('Failed to fetch audio: $e');

    }
  }

 static void playAudio(String audioUrl) async {
   // Create a cache manager instance
   final cacheManager = DefaultCacheManager();
   // Get the cached file if available, or download it if not cached
   final file = await cacheManager.getSingleFile(audioUrl);
   // Create an AudioPlayer object
   final player = AudioPlayer();
   // Set the audio source for the player using the cached file path
   player.setFilePath(file.path);
   // Play the audio file
   player.play();
   // Wait until the audio file is finished playing
   var isPlaying = await player.playing;
   if (!isPlaying) {
     // Dispose the AudioPlayer object
     player.dispose();
   }
   /* // Create an AudioPlayer object.
    final player = AudioPlayer();
    // Set the audio source for the player.
    player.setAudioSource(AudioSource.uri(Uri.parse(audioUrl)));
    // Play the audio file.
    player.play();
    // Wait until the audio file is finished playing.
    var isPlaying = await player.playing;
    if( !isPlaying){
      // Dispose the AudioPlayer object.
      player.dispose();
    }*/
  }

  static void pauseAudio() {
    final player = AudioPlayer();

    var isPlaying = player.playing;
    player.pause();
    isPlaying ==false;
  }

}









