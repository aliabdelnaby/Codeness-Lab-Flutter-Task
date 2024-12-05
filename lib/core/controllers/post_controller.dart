import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  var posts = <PostModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  RxBool hasMore = true.obs;

  final ApiService _apiService;
  int _currentPage = 1; // Current page number
  final int _pageSize = 10; // Number of posts to load per page

  PostController(this._apiService);

  @override
  void onInit() {
    fetchPosts(); // Fetch initial posts
    super.onInit();
  }

  void fetchPosts() async {
    if (isLoading.value || !hasMore.value) return;

    try {
      isLoading(true);
      final data = await _apiService.fetchPosts(page: _currentPage, limit: _pageSize);

      if (data.isEmpty) {
        hasMore(false); // No more posts to load
      } else {
        posts.addAll(data); // Append new posts to the list
        _currentPage++; // Increment the page number for the next load
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }

  void resetPosts() {
    // Reset pagination and fetch posts again
    _currentPage = 1;
    hasMore(true);
    posts.clear();
    fetchPosts();
  }
}
