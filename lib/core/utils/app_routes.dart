import 'package:get/get.dart';

import '../../presentation/views/post_details_view.dart';
import '../../presentation/views/posts_view.dart';

class AppRoutes {
  static const String postsView = '/';
  static const String postDetailsView = '/postDetailsView';

  static List<GetPage> routes = [
    GetPage(name: postsView, page: () => const PostsView()),
    GetPage(name: postDetailsView, page: () => const PostDetailsView()),
  ];
}
