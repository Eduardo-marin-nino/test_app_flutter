import 'package:flutter_test/flutter_test.dart';
import 'package:test_app_flutter/core/api/service_list_images.dart';
import 'package:test_app_flutter/core/config/dotenv_config.dart';
import 'package:test_app_flutter/data/models/images_model/images_model.dart';

void main() {
  late ServiceListImages serviceImages;

  setUpAll(() {
    DotEnvAppPath.testLoad();
    serviceImages = ServiceListImages();
  });

  testWidgets('Sucess get images', (tester) async {
    final List<ImagesModel>? images = await serviceImages.getImages(50, 1);
    expect(images, isNot(equals(null)));
    expect(images!.length, isNot(equals(0)));
  });
}
