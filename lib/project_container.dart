import 'package:flutter/material.dart';

class ProjectBox extends StatelessWidget {
  const ProjectBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 800,
      child: Stack(
        children: [
          // Backdrop rectangle (slightly offset to the left & top)
          Positioned(
            top: 8,
            left: -8,
            child: Container(
              width: 300,
              height: 200,

              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
            ),
          ),

          // Foreground rectangle
          Positioned(
            top: 0,
            left: 8,
            child: Container(
              width: 300,
              height: 200,

              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: const Center(
                child: Text(
                  "Main Card",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}