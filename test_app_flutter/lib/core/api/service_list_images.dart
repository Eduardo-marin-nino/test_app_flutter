import 'package:test_app_flutter/core/api/generic_api.dart';
import 'package:test_app_flutter/core/paths/local_paths.dart';
import 'package:test_app_flutter/data/models/images_model/images_model.dart';

class ServiceListImages {
  Future<List<ImagesModel>?> getImages(int limit, int page) async =>
      GenericApi<List<ImagesModel>, List<dynamic>>(
        endpoint: "${LocalAppPaths.urlApiImages}?_limit=$limit&_page=$page",
        callback: (response) => (response != null)
            ? List.from(
                response.map(
                  (value) => ImagesModel.fromJson(value),
                ),
              )
            : [],
      ).getAll();
}
