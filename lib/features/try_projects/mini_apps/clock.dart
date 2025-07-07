import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/current_state.dart';

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentState>(
      builder: (context, currentState, _) {

        Color getBackgroundColor(bool isDarkMode) {
          return isDarkMode ? const Color(0xFF1B1C16) : Colors.white;
        }



        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: getBackgroundColor(currentState.isDarkMode),
            ),
            // child: ClockView(size: 300),
          ),
        );
      },
    );
  }
}
