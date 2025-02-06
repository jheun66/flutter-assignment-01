import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/constants/gaps.dart';
import 'package:threads_clone/features/main_navigation/home/widgets/post_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _itemCount = 10;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                title: FaIcon(
                  FontAwesomeIcons.threads,
                  size: 40,
                ),
                centerTitle: true,
              ),
              floating: true,
              snap: true,
              pinned: false,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          Gaps.v20,
                          PostItem(),
                          Gaps.v20,
                          Divider(
                            height: 0,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  );
                },
                childCount: _itemCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
