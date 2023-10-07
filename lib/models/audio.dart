class AudioFile {
  final int id;
  final String audioUrl;

  AudioFile({
    required this.id,
    required this.audioUrl,
  });

  /*factory AudioFile.fromJson(Map<String, dynamic> json) {
    return AudioFile(
      id: json['id'],
      audioUrl: json['audio_url'],
    );
  }*/
}
