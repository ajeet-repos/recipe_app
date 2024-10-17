class Video {
  String videoUrl;
  int totalLength;

  Video({required this.videoUrl, required this.totalLength});

  factory Video.fromMap(Map<String, dynamic> json) => Video(
    videoUrl: "https://www.youtube.com/watch?v=sv3TXMSv6Lw",//json["video_url"],
    totalLength: json["total_length"],
  );
}