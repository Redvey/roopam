import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roopam/features/try_projects/widgets/phone_home_page.dart';
import 'package:roopam/provider/current_state.dart';


class ScreenWrapper extends StatelessWidget {
  final Widget childG;

  const ScreenWrapper({super.key, required this.childG});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar
        Consumer<CurrentState>(
          builder: (context, instance, _) {
            if (!instance.isMainScrren) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: instance.backgroundColor,
                ),
                padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      instance.title ?? "",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: instance.textThemeColor,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            instance.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                            color: instance.textThemeColor,
                          ),
                          onPressed: () {
                            instance.toggleDarkMode();
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: instance.textThemeColor,
                          ),
                          onPressed: () {
                            instance.changePhoneScreen(
                              const PhoneHomeScreen(),
                              true,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return Container(); // No AppBar if it's the main screen
          },
        ),

        // Main content
        Expanded(
          child: Consumer<CurrentState>(
            builder: (context, instance, _) {
              return Container(
                color: instance.backgroundColor,
                child: childG,
              );
            },
          ),
        ),
      ],
    );
  }
}
