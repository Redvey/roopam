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


          ],
        ),
      ),
    );
  }
}
