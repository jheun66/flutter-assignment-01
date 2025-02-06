import 'package:flutter/material.dart';

List texts = [
  "I just don't like it",
  "It's unlawful content under NetzDG",
  "It's spam",
  "Hate speech or symbols",
  "Nudity or sexual activity",
  "I Just don't like it",
  "It's unlawful content under NetzDG",
  "It's spam",
  "Hate speech or symbols",
];

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                'Report',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade200,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                      title: Text(
                        "Why are you reporting this thread?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        "Your report is anonymous, expect if you're reporting an intellectual property infringement, if someone is in immediate danger, call the local emergency services - dont't wait.",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    for (var text in texts)
                      Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 20),
                            title: Text(
                              text,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
