import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key, required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height-300,
      width: screenSize.width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/footer.png',),fit: BoxFit.fill)
      ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white), // Optional border
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(0), // sharp
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(0), // sharp
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: const Text("data"),
            ),

          ],
        ),
      ),
    );
  }
}
