import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';
import 'package:stock_viewer/features/image/domain/repositories/image_repository.dart';
import 'package:stock_viewer/features/image/domain/usecases/get_searched_images.dart';

import 'get_searched_images_test.mocks.dart';

@GenerateMocks([ImageRepository])
void main() {
  late GetSearchedImages usecase;
  late MockImageRepository mockImageRepository;
  late String tSearchTerm;
  late List<SVImage> tSearchedImages;

  setUp(() {
    // Dependency Injection
    mockImageRepository = MockImageRepository();
    usecase = GetSearchedImages(mockImageRepository);

    // assign values to constants
    tSearchTerm = 'bear';
    tSearchedImages = [
      SVImage(
          width: 1,
          height: 1,
          photographer: 'Bear',
          url: 'https://bear.com',
          imageUrl: 'https://bear.com/image')
    ];
  });

  test('should get list of searched images from the repository', () async {
    // Arrange
    when(mockImageRepository.getSearchedImages(tSearchTerm))
        .thenAnswer((_) async => tSearchedImages);

    // Act
    final result = await usecase(Params(searchTerm: tSearchTerm));

    // Assert
    expect(result, tSearchedImages);
    verify(mockImageRepository.getSearchedImages(tSearchTerm));
    verifyNoMoreInteractions(mockImageRepository);
  });
}
