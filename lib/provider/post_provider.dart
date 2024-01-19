import 'package:flutter/material.dart';
import 'package:providertestapp/model/post_model.dart';
import 'package:providertestapp/repository/post_repository.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel> model = [];
  bool isLoading = false;

  getPosts() async {
    try {
      if (model.isNotEmpty) {
        return model;
      } else {
        await Future.delayed(const Duration(seconds: 2));
        isLoading = true;
        model = await postRepository.getAllPost();

        notifyListeners();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
