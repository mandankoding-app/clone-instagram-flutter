import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ig_project_2/models/content_model.dart';
import 'package:ig_project_2/widgets/buble_story.dart';
import 'package:ig_project_2/widgets/user_post.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List users = [
    'hasan',
    'Sabar',
    'Marko',
    'Budi',
    'Rojanah',
    'Bahri',
    'Werin'
  ];

  final String dataUrl =
      'https://pixabay.com/api/?key=37806329-dc35bd328007dee1026359f1f&q=green+flowers&image_type=photo&pretty=true';

  Future<List<Content>> getListContent() async {
    final response = await Dio().get(dataUrl);
    final dataModel =
        ContentModel.fromJson(response.data as Map<String, dynamic>);
    return dataModel.ListContent;
  }

  List<Content> ListContent = [];

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    getListContent().then((result) {
      ListContent = result;
      _isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/icons/ic_logo.svg',
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        actions: [
          SvgPicture.asset(
            'assets/icons/ic_add.svg',
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SvgPicture.asset(
              'assets/icons/ic_favorite.svg',
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/icons/ic_send.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 123,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BubbleStory(
                  name: users[index],
                  isMe: index == 0 ? true : false,
                  isLive: index == 1 ? true : false,
                );
              },
              itemCount: users.length,
            ),
          ),
          const Divider(
            height: 1,
            // color: Colors.transparent,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return UserPost(
                  content: ListContent[index],
                );
              },
              itemCount: ListContent.length,
            ),
          ),
        ],
      ),
    );
  }
}
