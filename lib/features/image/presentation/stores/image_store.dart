import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';

part 'image_store.g.dart';

class ImageStore extends _ImageStore with Store {}

abstract class _ImageStore with Store {
  @observable
  ObservableList<SVImage> images = ObservableList();

  @action
  Future loadSuggestedImages() async {
    try {} catch (e) {
      debugPrint('Could not load images.');
    }
  }
}
