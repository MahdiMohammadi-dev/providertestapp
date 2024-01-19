import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertestapp/provider/post_provider.dart';

class PostProviderScreen extends StatefulWidget {
  const PostProviderScreen({super.key});

  @override
  State<PostProviderScreen> createState() => _PostProviderScreenState();
}

class _PostProviderScreenState extends State<PostProviderScreen> {
  @override
  void initState() {
    var provider = Provider.of<PostProvider>(context, listen: false);
    provider.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Consumer<PostProvider>(
      builder: (context, value, child) {
        if (value.isLoading == false) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (value.isLoading == true) {
          var data = value.model;
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var post = data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(4),
                      width: 100,
                      height: 200,
                      color: Colors.blueAccent,
                      child: Text(
                        post.title.toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  );
                }),
          );
        }
        return const SizedBox();
      },
    )));
  }
}
