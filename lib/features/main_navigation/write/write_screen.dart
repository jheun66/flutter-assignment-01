import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/constants/gaps.dart';
import 'package:threads_clone/constants/sizes.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  String textContent = "";
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      setState(() {
        textContent = textEditingController.text;
      });
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _onCancelTap() {
    Navigator.of(context).pop();
  }

  void _onPostTap() {
    if (textContent.isEmpty) return;
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.9,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: GestureDetector(
            onTap: _onCancelTap,
            child: Center(
                child: Text(
              "Cancel",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
          ),
          title: Text(
            "New thread",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/31583518?v=4"),
                      ),
                      Gaps.v10,
                      Container(
                        height: 60,
                        width: 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Gaps.v10,
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/31583518?v=4"),
                      ),
                    ],
                  ),
                  Gaps.h10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pepe',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.v3,
                        TextField(
                          controller: textEditingController,
                          expands: false,
                          minLines: 1,
                          maxLines: 5,
                          maxLength: 200,
                          autofocus: true,
                          textInputAction: TextInputAction.newline,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintText: "Start a thread...",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 6,
                            ),
                          ),
                        ),
                        Gaps.v3,
                        FaIcon(
                          (FontAwesomeIcons.paperclip),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              child: BottomAppBar(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Anyone can reply",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: _onPostTap,
                      child: Text(
                        "Post",
                        style: TextStyle(
                          color: textContent.isNotEmpty
                              ? Colors.blueAccent
                              : Colors.blue.shade100,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
