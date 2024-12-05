import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  var posts = <PostModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  RxList<PostModel> originalPosts = <PostModel>[].obs;

  final ApiService _apiService;
  PostController(this._apiService);

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      final data = await _apiService.fetchPosts();
      originalPosts.value = data;

      posts.value = data;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
