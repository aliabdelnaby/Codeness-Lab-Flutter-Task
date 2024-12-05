import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/controllers/post_controller.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.put(PostController(Get.find()));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Search Bar Widget
          Padding(
            padding: const EdgeInsetsDirectional.all(16.0),
            child: TextField(
              onChanged: (value) {
                if (value.isEmpty) {
                  // Reset to original list when search field is empty
                  controller
                      .fetchPosts(); // Assuming you have a method to reload original posts
                } else {
                  // Filter posts based on search query
                  controller.posts.value = controller.originalPosts
                      .where((post) => post.title
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                }
              },
              decoration: InputDecoration(
                hintText: 'Search posts...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Posts List Widget
          Expanded(
            child: Obx(
              () {
                // Show loading indicator while posts are being fetched
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blueAccent,
                    ),
                  );
                }
                // Show error message if an error occurred
                if (controller.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(
                      controller.errorMessage.value,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  );
                }
                // Show posts list if posts are available
                return ListView.builder(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 16, vertical: 8),
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    final post = controller.posts[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/postDetailsView', arguments: post);
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                post.body,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
