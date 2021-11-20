class SVImage {
  final int width;
  final int height;
  final String photographer;
  final String url;
  final String imageUrl;

  SVImage({
    required this.width,
    required this.height,
    required this.photographer,
    required this.url,
    required this.imageUrl,
  });

  factory SVImage.fromJson(Map<String, dynamic> json) => SVImage(
        width: json['width'],
        height: json['height'],
        photographer: json['photographer'],
        url: json['url'],
        imageUrl: json['src']['large'],
      );
}
