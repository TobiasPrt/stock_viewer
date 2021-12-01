import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';

class SVImageModel extends SVImage {
  SVImageModel({
    required int width,
    required int height,
    required String photographer,
    required String url,
    required String imageUrl,
  }) : super(
            width: width,
            height: height,
            photographer: photographer,
            url: url,
            imageUrl: imageUrl);

  factory SVImageModel.fromJson(Map<String, dynamic> json) {
    return SVImageModel(
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      photographer: json['photographer'] as String,
      url: json['url'] as String,
      imageUrl: json['src']['large'] as String,
    );
  }
}
