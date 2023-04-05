import 'package:flutter/material.dart';
import 'package:test_app_flutter/gui/widgets/app_bar.dart';
import 'package:test_app_flutter/core/paths/local_paths.dart';
import 'package:test_app_flutter/gui/templates/home_template.dart';
import 'package:test_app_flutter/core/theme/colors_app_theme.dart';
import 'package:test_app_flutter/core/api/service_list_images.dart';
import 'package:test_app_flutter/gui/widgets/activity_indicator.dart';
import 'package:test_app_flutter/data/models/images_model/images_model.dart';

class ListImagesView extends StatefulWidget {
  const ListImagesView({super.key});

  @override
  State<ListImagesView> createState() => _ListImagesViewState();
}

class _ListImagesViewState extends State<ListImagesView> {
  List<ImagesModel?> images = [];
  final scrollController = ScrollController();
  int currentPage = 1;
  bool hasMore = true;
  bool isLoading = false;

  @override
  void initState() {
    getImagesApi();
    scrollController.addListener(() {
      final offSet = scrollController.offset;
      final maxScroll = scrollController.position.maxScrollExtent;

      if (maxScroll == offSet) {
        getImagesApi();
      }
    });
    super.initState();
  }

  Future getImagesApi() async {
    if (isLoading) return;
    isLoading = true;
    const int limit = 50;
    final imagesApi = await ServiceListImages().getImages(limit, currentPage);

    setState(() {
      if (imagesApi!.isNotEmpty) {
        images.addAll(imagesApi);
      }
      if (imagesApi.isEmpty) {
        hasMore = false;
      }
      currentPage++;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future onRefresh() async {
    setState(() {
      currentPage = 0;
      images.clear();
      hasMore = true;
      isLoading = false;
    });
    getImagesApi();
  }

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      appBar: CustomAppBar(
        centerTitle: true,
        showGradient: false,
        title: Image.asset(
          LocalAppPaths.imgLogoName,
          fit: BoxFit.contain,
          height: 40,
        ),
      ),
      child: Container(
        color: Colors.white,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(
                  10, 20, 10, (kBottomNavigationBarHeight * 1.4)),
              itemCount: images.length + 1,
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemBuilder: (context, index) {
                if (index < images.length) {
                  final img = images[index];
                  return Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text("${img!.title}"),
                      leading: CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.grey[100],
                        backgroundImage:
                            img.url!.isNotEmpty ? NetworkImage(img.url!) : null,
                        child: img.url!.isEmpty ? _iconPhoto() : null,
                      ),
                    ),
                  );
                } else {
                  return hasMore
                      ? const ActivityIndicator()
                      : const Center(
                          child: Text("No se encontró más información"),
                        );
                }
              }),
        ),
      ),
    );
  }

  Widget _iconPhoto() => const Icon(
        Icons.person,
        size: 36,
        color: ColorsAppTheme.primaryColor,
      );
}
