import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/models/post_model.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final PostModel post = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Post Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Title
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // Divider
            const Divider(
              thickness: 1.5,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 16),
            // Post Body
            Text(
              post.body,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
