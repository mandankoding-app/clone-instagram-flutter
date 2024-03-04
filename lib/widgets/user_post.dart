import 'package:flutter/material.dart';
import 'package:ig_project_2/models/content_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserPost extends StatelessWidget {
  const UserPost({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Content content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 6, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(content.userImageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      content.user,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: Image.network(
            content.largeImageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/ic_favorite.svg',
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                'assets/icons/ic_comment.svg',
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                'assets/icons/ic_send.svg',
                color: Colors.white,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              Text(
                '${content.likes} likes',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            text: TextSpan(
              // style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: content.user,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: content.tags,
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            'View all comments',
            // style: TextStyle(color: Colors.black45),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            '20 hours ago',
            // style: TextStyle(color: Colors.black54),
          ),
        ),
      ],
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty<Content>('content', content));
  // }
}
