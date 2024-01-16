import 'package:dio/dio.dart';
import 'package:providertestapp/model/post_model.dart';

abstract class IPostDataSource {
  Future<List<PostModel>> getAllPost();
}

class PostDataSource implements IPostDataSource {
  final Dio httpClient;

  PostDataSource(this.httpClient);
  @override
  Future<List<PostModel>> getAllPost() async {
    try {
      var response = await httpClient.get('/posts');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => PostModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Check Nework');
      }
    } catch (e) {
      throw Exception('Check Nework');
    }
  }
}
