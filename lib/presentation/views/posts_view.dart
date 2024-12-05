import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/post_controller.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.put(PostController(Get.find()));
    final ScrollController scrollController = ScrollController();
    // Listen for scroll events to trigger pagination
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          controller.fetchPosts(); // Load more posts when reaching the bottom
        }
      },
    );

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
                  controller.resetPosts(); // Reload all posts
                } else {
                  controller.posts.value = controller.posts
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
          // Posts List with Pagination
          Expanded(
            child: Obx(
              () {
                if (controller.isLoading.value && controller.posts.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blueAccent,
                    ),
                  );
                }

                if (controller.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(
                      controller.errorMessage.value,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 16, vertical: 8),
                  itemCount: controller.posts.length + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.posts.length) {
                      return controller.hasMore.value
                          ? const SizedBox.shrink()
                          : const SizedBox.shrink(); // Show loading or nothing
                    }

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
