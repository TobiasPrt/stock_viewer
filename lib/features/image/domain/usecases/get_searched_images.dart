import 'package:equatable/equatable.dart';
import 'package:stock_viewer/core/usecase/usecase.dart';
import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';
import 'package:stock_viewer/features/image/domain/repositories/image_repository.dart';

class GetSearchedImages implements UseCase<List<SVImage>, Params> {
  GetSearchedImages(this.imageRespository);

  final ImageRespository imageRespository;

  @override
  Future<List<SVImage>> call(Params params) async {
    return imageRespository.getSearchedImages(params.searchterm);
  }
}

class Params extends Equatable {
  const Params({required this.searchterm});

  final String searchterm;

  @override
  List<Object?> get props => [searchterm];
}
