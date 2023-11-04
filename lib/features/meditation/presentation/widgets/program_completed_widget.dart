import 'package:flutter/material.dart';

class ProgramCompletedWidget extends StatelessWidget {
  const ProgramCompletedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.celebration_outlined,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "You successfully completed this program on "
            "25 October, 2022",
          ),
        ],
      ),
    );
  }
}
