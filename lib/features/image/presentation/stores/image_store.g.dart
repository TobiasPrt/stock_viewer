// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImageStore on _ImageStore, Store {
  Computed<LoadingState>? _$loadingStateComputed;

  @override
  LoadingState get loadingState => (_$loadingStateComputed ??=
          Computed<LoadingState>(() => super.loadingState,
              name: '_ImageStore.loadingState'))
      .value;

  final _$_imageFutureAtom = Atom(name: '_ImageStore._imageFuture');

  @override
  ObservableFuture<List<SVImage>>? get _imageFuture {
    _$_imageFutureAtom.reportRead();
    return super._imageFuture;
  }

  @override
  set _imageFuture(ObservableFuture<List<SVImage>>? value) {
    _$_imageFutureAtom.reportWrite(value, super._imageFuture, () {
      super._imageFuture = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_ImageStore.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$imagesAtom = Atom(name: '_ImageStore.images');

  @override
  ObservableList<SVImage> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<SVImage> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$loadSearchedImagesAsyncAction =
      AsyncAction('_ImageStore.loadSearchedImages');

  @override
  Future<void> loadSearchedImages(String searchTerm) {
    return _$loadSearchedImagesAsyncAction
        .run(() => super.loadSearchedImages(searchTerm));
  }

  final _$loadSuggestedImagesAsyncAction =
      AsyncAction('_ImageStore.loadSuggestedImages');

  @override
  Future<void> loadSuggestedImages() {
    return _$loadSuggestedImagesAsyncAction
        .run(() => super.loadSuggestedImages());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
images: ${images},
loadingState: ${loadingState}
    ''';
  }
}
