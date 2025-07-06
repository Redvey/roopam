import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roopam/core/constants/colors.dart';
import 'package:roopam/provider/current_state.dart';
import '../../../../../data/data.dart';

class PhoneHomeScreen extends StatelessWidget {
  const PhoneHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentState>(
      builder: (context, currentState, _) {
        return Container(
          padding: const EdgeInsets.only(top: 70, left: 24, right: 24),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mobile.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.start,
            children: List.generate(
              apps.length,
                  (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    CustomButton(
                      onPressed: () {
                        // ✅ Handle screen or link
                        if (apps[index].link != null) {
                          currentState.launchInBrowser(apps[index].link!);
                        } else if (apps[index].screen != null) {
                          currentState.changePhoneScreen(
                            apps[index].screen!,
                            false,
                            titleL: apps[index].title,
                          );
                        }
                      },
                      margin: const EdgeInsets.only(bottom: 5),
                      animate: true,
                      width: 45,
                      height: 45,
                      backgroundColor: apps[index].color,
                      borderRadius: 100,
                      child: Center(
                        child: Icon(
                          apps[index].icon,
                          size: 25,
                          color: const Color(0xFF2A2929),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      child: Center(
                        child: Text(
                          apps[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontFamily: 'Biryani',
                            fontSize: 11,
                            color: AppColors.yellow,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
