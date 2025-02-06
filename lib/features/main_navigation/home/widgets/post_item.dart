import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/constants/gaps.dart';
import 'package:threads_clone/constants/sizes.dart';
import 'package:threads_clone/features/main_navigation/home/widgets/post_images.dart';
import 'package:threads_clone/features/main_navigation/home/widgets/post_setting_bottom_sheet.dart';
import 'package:threads_clone/features/main_navigation/home/widgets/repliers_widget.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  final faker = Faker();
  final random = RandomGenerator(seed: DateTime.now().millisecondsSinceEpoch);
  late String userName;
  late String sentence;
  late int since;
  late int replies;
  late int likes;
  late bool hasImage;
  late List<String> repliers;
  late List<String> images;

  String getImage() {
    final random = Random();
    return 'https://picsum.photos/300/200?hash=${random.nextInt(10000)}';
  }

  @override
  void initState() {
    super.initState();
    userName = faker.internet.userName();

    sentence = faker.lorem.sentence();

    since = random.integer(60);

    replies = random.integer(4);
    // 0~3
    likes = random.integer(1000);

    hasImage = random.integer(3) != 0;

    repliers = List.generate(replies, (index) => getImage());

    images = List.generate(5, (index) => getImage());

    setState(() {});
  }

  void _onPostSettingTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => PostSettingBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                AvatarWithPlus(
                  profileUrl: getImage(),
                ),
                Gaps.v10,
                Expanded(
                  child: Container(
                    width: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  ),
                ),
                Gaps.v10,
                replies != 0
                    ? RepliersWidget(
                        repliers: repliers,
                      )
                    : Container(),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "${since}m",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Gaps.h10,
                          GestureDetector(
                              onTap: () => _onPostSettingTap(context),
                              child: FaIcon(FontAwesomeIcons.ellipsis)),
                        ],
                      ),
                    ],
                  ),
                  Text(sentence),
                  hasImage
                      ? PostImages(
                          images: images,
                        )
                      : Container(),
                  Gaps.v10,
                  Row(
                    spacing: 10,
                    children: [
                      FaIcon(FontAwesomeIcons.heart),
                      FaIcon(FontAwesomeIcons.message),
                      FaIcon(FontAwesomeIcons.retweet),
                      FaIcon(FontAwesomeIcons.paperPlane),
                    ],
                  ),
                  Gaps.v10,
                  Row(
                    children: [
                      Gaps.h10,
                      Text(
                        "$replies replies",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Gaps.h10,
                      FaIcon(
                        FontAwesomeIcons.solidCircle,
                        size: 4,
                        color: Colors.grey,
                      ),
                      Gaps.h10,
                      Text(
                        "$likes likes",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarWithPlus extends StatelessWidget {
  const AvatarWithPlus({
    super.key,
    required this.profileUrl,
  });

  final String profileUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(profileUrl),
          ),
        ),
        Positioned(
          bottom: -Sizes.size4,
          right: -Sizes.size4,
          child: Container(
            padding: EdgeInsets.all(Sizes.size4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: FaIcon(
              FontAwesomeIcons.circlePlus,
              size: Sizes.size16,
            ),
          ),
        )
      ],
    );
  }
}
