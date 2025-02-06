import 'package:flutter/material.dart';

class RepliersWidget extends StatelessWidget {
  const RepliersWidget({
    super.key,
    required this.repliers,
  });

  final List<String> repliers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            width: 20,
            height: 20,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                repliers[0],
              ),
            ),
          ),
          Positioned(
            left: 5,
            bottom: 10,
            width: 16,
            height: 16,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                repliers[0],
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 0,
            width: 12,
            height: 12,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                repliers[0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
