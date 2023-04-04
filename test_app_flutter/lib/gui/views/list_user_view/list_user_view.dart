import 'package:flutter/material.dart';
import 'package:test_app_flutter/gui/widgets/app_bar.dart';
import 'package:test_app_flutter/core/paths/local_paths.dart';
import 'package:test_app_flutter/core/api/service_list_user.dart';
import 'package:test_app_flutter/gui/templates/home_template.dart';
import 'package:test_app_flutter/data/models/user_model/user_model.dart';

import 'widget/render_list_widget.dart';

class ListUserHome extends StatefulWidget {
  const ListUserHome({super.key});

  @override
  State<ListUserHome> createState() => _ListUserHomeState();
}

class _ListUserHomeState extends State<ListUserHome> {
  List<UserModel?> users = <UserModel>[];
  final scrollController = ScrollController();
  int currentPage = 1;
  bool hasMore = true;
  bool isLoading = false;

  @override
  void initState() {
    getUsers();
    scrollController.addListener(() {
      final offSet = scrollController.offset;
      final maxScroll = scrollController.position.maxScrollExtent;

      if (offSet >= (maxScroll - 100)) {
        getUsers();
      }
    });
    super.initState();
  }

  Future getUsers() async {
    if (isLoading) return;
    isLoading = true;
    final listUser = await ServiceListUser().getUsers(currentPage);

    setState(() {
      if (listUser!.isNotEmpty) {
        users.addAll(listUser);
      }
      if (listUser.isEmpty) {
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
      users.clear();
      hasMore = true;
      isLoading = false;
    });
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      physics: const NeverScrollableScrollPhysics(),
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
            child: RenderListUser(
              users: users,
              hasMore: hasMore,
              controller: scrollController,
            ),
          )),
    );
  }
}
