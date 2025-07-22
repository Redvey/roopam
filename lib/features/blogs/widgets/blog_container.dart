import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors.dart';

class BlogContainer extends StatelessWidget {
  const BlogContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 0.25),

          gradient: AppColors.blogGradient,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        height: 70,
        width: 420,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.newspaper,
                size: 24,
                color: AppColors.lightYellow,
              ),
              Text(
                "Blog Header",
                style: GoogleFonts.poppins(
                  color: AppColors.lightYellow,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.read_more,
                size: 24,
                color: AppColors.lightYellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}