import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:stock_viewer/core/error/server_exception.dart';
import 'package:stock_viewer/features/image/data/models/sv_image_model.dart';

abstract class ImageRemoteDataSource {
  /// Calls the https://api.pexels.com/v1/curated endpoint
  ///
  /// Throws a [ServerException] for all errors
  Future<List<SVImageModel>> getSuggestedImages();

  /// Calls the https://api.pexels.com/v1/search endpoint
  ///
  /// Throws a [ServerException] for all errors
  Future<List<SVImageModel>> getSearchedImages(String searchterm);
}

class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  ImageRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<List<SVImageModel>> getSearchedImages(String searchterm) =>
      _getImagesFromUrl('/v1/search',
          <String, dynamic>{'query': searchterm, 'per_page': '80'});

  @override
  Future<List<SVImageModel>> getSuggestedImages() =>
      _getImagesFromUrl('/v1/curated', <String, dynamic>{'per_page': '80'});

  Future<List<SVImageModel>> _getImagesFromUrl(
      String endpoint, Map<String, dynamic> args) async {
    final response = await client.get(
      Uri.https('api.pexels.com', endpoint, args),
      headers: {
        'Authorization': dotenv.env['PEXELS_API_KEY']!,
      },
    );

    if (response.statusCode == 200) {
      final photoDataList = jsonDecode(response.body)['photos'] as List;
      return photoDataList
          .map((dynamic photoData) =>
              SVImageModel.fromJson(photoData as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
