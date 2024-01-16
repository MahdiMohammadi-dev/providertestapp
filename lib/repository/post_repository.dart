import 'package:providertestapp/datasource/post_datasource.dart';
import 'package:providertestapp/dio/base_url.dart';
import 'package:providertestapp/model/post_model.dart';

final postRepository = PostRepository(PostDataSource(httpClient));

abstract class IPostRepository {
  Future<List<PostModel>> getAllPost();
}

class PostRepository implements IPostRepository {
  final IPostDataSource dataSource;

  PostRepository(this.dataSource);
  @override
  Future<List<PostModel>> getAllPost() => dataSource.getAllPost();
}
