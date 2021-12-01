import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:stock_viewer/features/image/data/datasources/image_data_source.dart';
import 'package:stock_viewer/features/image/data/repositories/image_repository_impl.dart';
import 'package:stock_viewer/features/image/domain/repositories/image_repository.dart';
import 'package:stock_viewer/features/image/domain/usecases/get_suggested_images.dart';

final sl = GetIt.instance;

Future init() async {
  sl
    // Use Cases
    ..registerLazySingleton(() => GetSuggestedImages(sl()))
    // Repository
    ..registerLazySingleton<ImageRespository>(
        () => ImageRepositoryImpl(imageRemoteDataSource: sl()))
    // Data Sources
    ..registerLazySingleton<ImageRemoteDataSource>(
        () => ImageRemoteDataSourceImpl(client: sl()))
    // External
    ..registerLazySingleton(() => http.Client());
}
