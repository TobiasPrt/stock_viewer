import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_viewer/core/usecases/usecase.dart';
import 'package:stock_viewer/features/image/domain/entities/sv_image.dart';
import 'package:stock_viewer/features/image/domain/repositories/image_repository.dart';
import 'package:stock_viewer/features/image/domain/usecases/get_suggested_images.dart';

import 'get_searched_images_test.mocks.dart';

@GenerateMocks([ImageRepository])
void main() {
  late GetSuggestedImages usecase;
  late MockImageRepository mockImageRepository;
  late List<SVImage> tSuggestedImages;

  setUp(() {
    // Dependency Injection
    mockImageRepository = MockImageRepository();
    usecase = GetSuggestedImages(mockImageRepository);

    // Set up constants
    tSuggestedImages = [
      SVImage(
          width: 1,
          height: 1,
          photographer: 'Bear',
          url: 'https://bear.com',
          imageUrl: 'https://bear.com/image')
    ];
  });

  test('should get list of suggested images from the repository', () async {
    // Arrange
    when(mockImageRepository.getSuggestedImages())
        .thenAnswer((_) async => tSuggestedImages);

    // Act
    final result = await usecase(NoParams());

    // Assert
    expect(result, tSuggestedImages);
    verify(mockImageRepository.getSuggestedImages());
    verifyNoMoreInteractions(mockImageRepository);
  });
}
