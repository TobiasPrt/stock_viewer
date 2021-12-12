import 'package:mobx/mobx.dart';
import 'package:stock_viewer/core/error/server_exception.dart';
import 'package:stock_viewer/core/usecases/usecase.dart';
import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';
import 'package:stock_viewer/features/image/domain/usecases/get_searched_images.dart';
import 'package:stock_viewer/features/image/domain/usecases/get_suggested_images.dart';

part 'image_store.g.dart';

class ImageStore extends _ImageStore with _$ImageStore {
  ImageStore(GetSearchedImages getSearchedImages,
      GetSuggestedImages getSuggestedImages)
      : super(getSearchedImages, getSuggestedImages);
}

enum LoadingState { initial, loading, loaded }

abstract class _ImageStore with Store {
  _ImageStore(this._getSearchedImages, this._getSuggestedImages);

  final GetSearchedImages _getSearchedImages;
  final GetSuggestedImages _getSuggestedImages;

  @observable
  ObservableFuture<List<SVImage>>? _imageFuture;

  @computed
  LoadingState get loadingState {
    if (_imageFuture == null || _imageFuture?.status == FutureStatus.rejected) {
      return LoadingState.initial;
    }
    return _imageFuture?.status == FutureStatus.pending
        ? LoadingState.loading
        : LoadingState.loaded;
  }

  @observable
  String? errorMessage;

  @observable
  ObservableList<SVImage> images = ObservableList();

  @action
  Future<void> loadSearchedImages(String searchTerm) async {
    try {
      errorMessage = null;
      _imageFuture = ObservableFuture(
          _getSearchedImages.call(Params(searchTerm: searchTerm)));
      images
        ..clear()
        ..addAll(await _imageFuture!);
    } on ServerException {
      errorMessage = 'Could not load searched images';
    }
  }

  @action
  Future<void> loadSuggestedImages() async {
    try {
      errorMessage = null;
      _imageFuture = ObservableFuture(_getSuggestedImages.call(NoParams()));
      images.addAll(await _imageFuture!);
      await _imageFuture;
    } on ServerException {
      errorMessage = 'Could not load suggested images';
    }
  }
}
