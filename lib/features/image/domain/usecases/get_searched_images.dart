import 'package:equatable/equatable.dart';
import 'package:stock_viewer/core/usecases/usecase.dart';
import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';
import 'package:stock_viewer/features/image/domain/repositories/image_repository.dart';

class GetSearchedImages implements UseCase<List<SVImage>, Params> {
  GetSearchedImages(this.imageRepository);

  final ImageRepository imageRepository;

  @override
  Future<List<SVImage>> call(Params params) async {
    return imageRepository.getSearchedImages(params.searchTerm);
  }
}

class Params extends Equatable {
  const Params({required this.searchTerm});

  final String searchTerm;

  @override
  List<Object?> get props => [searchTerm];
}
