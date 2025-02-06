import 'package:flutter/material.dart';
import 'package:threads_clone/constants/gaps.dart';

class PostImages extends StatelessWidget {
  const PostImages({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.network(images[index]),
            );
          },
          separatorBuilder: (context, index) {
            return Gaps.h10;
          },
          itemCount: images.length,
        ),
      ),
    );
  }
}
