import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:stock_viewer/features/image/data/datasources/image_data_source.dart';
import 'package:stock_viewer/features/image/data/repositories/image_repository_impl.dart';
import 'package:stock_viewer/features/image/domain/repositories/image_repository.dart';
import 'package:stock_viewer/features/image/domain/usecases/get_searched_images.dart';
import 'package:stock_viewer/features/image/domain/usecases/get_suggested_images.dart';
import 'package:stock_viewer/features/image/presentation/stores/image_store.dart';

final sl = GetIt.instance;

Future init() async {
  sl
    // Stores
    ..registerLazySingleton(() => ImageStore(sl(), sl()))
    // Use Cases
    ..registerLazySingleton(() => GetSuggestedImages(sl()))
    ..registerLazySingleton(() => GetSearchedImages(sl()))
    // Repository
    ..registerLazySingleton<ImageRepository>(
        () => ImageRepositoryImpl(imageRemoteDataSource: sl()))
    // Data Sources
    ..registerLazySingleton<ImageRemoteDataSource>(
        () => ImageRemoteDataSourceImpl(client: sl()))
    // External
    ..registerLazySingleton(() => http.Client());
}
