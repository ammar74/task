import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:task/models/audio.dart';
import 'package:task/repositories/audio_repo.dart';

class ListenAudiosSection extends StatefulWidget {
  const ListenAudiosSection({super.key});

  @override
  _ListenAudiosSectionState createState() => _ListenAudiosSectionState();
}

class _ListenAudiosSectionState extends State<ListenAudiosSection> {
  List<AudioFile> audioFiles = [];
  bool isLoading = false;
  final AudioPlayer player = AudioPlayer();
  bool _isPlaying = false;
  var future;
  late final String uri;


  @override
  void initState() {
    super.initState();
    future = AudioRepository().fetchAudioFiles();
    // print('the return of the future is ${future.toString()}');
    player.playerStateStream.listen((playerState) {
      setState(() {
        _isPlaying = playerState == PlayerState;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Listen Audios',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder<List<AudioFile>>(
                future: future,
                builder: (context, snapshot) {
                  // print('snapshot state is ${snapshot.connectionState}');
                  // print('snapshot data is ${snapshot.data}');
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: IconButton(
                              icon: isLoading
                                  ? const Icon(Icons.hourglass_empty)
                                  : _isPlaying
                                  ? const Icon(Icons.pause)
                                  : const Icon(Icons.play_arrow),
                              onPressed: () {
                                // Implement audio playback functionality here
                                setState(() {
                                  if (isLoading) {
                                    // Handle loading state
                                  } else if (_isPlaying) {
                                    // Handle pause state
                                    AudioRepository.pauseAudio();
                                  } else {
                                    isLoading = true;
                                    _isPlaying= true;
                                    // Handle play state
                                    AudioRepository.playAudio(snapshot.data![index].audioUrl);
                                    isLoading = false;
                                  }
                                });

                              },
                            ),
                            title: Text('Audio ${index + 1}'),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Oops there is an error ${snapshot
                            .error}, Please Try Later'));
                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }
            )
          ]
      ),
    );
  }


}
