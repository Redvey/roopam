import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roopam/widgets/circular_object.dart';
import 'package:roopam/features/try_projects/widgets/phone_home_page.dart';
import 'package:roopam/provider/current_state.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: const Color(0xffB10D31),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 200,
          //   width: 200,
          //   child: RiveAnimation.asset('assets/rive/little_boy.riv'),
          // ),
          Text(
            "I love",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'HokyaaSans',
              color: Color(0xF7FFF87F),
            ),
          ),
          Text(
            "Developing x",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'HokyaaSans',
              color: Color(0xF7FFF87F),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Try these mini",
                style: TextStyle(
                  fontFamily: 'ScotchDisplay',
                  fontSize: 64,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF3AFC67),
                ),
              ),
              Text(
                "Projects",
                style: TextStyle(
                  fontFamily: 'ScotchDisplay',
                  fontSize: 64,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFFE2DCC8),
                ),
              ),
              CircularMarquee(
                child: Icon(Icons.cloud, size: 128, color: Color(0xF7FFF87F)),
              ),
              SizedBox(
                height: 500,
                width: 300,
                child: DeviceFrame(
                  device: Devices.android.samsungGalaxyNote20Ultra,
                  isFrameVisible: true,
                  orientation: Orientation.portrait,
                  screen: Consumer<CurrentState>(
                    builder: (context, currentState, _) {
                      return Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/mobile.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: PhoneHomeScreen(),
                      );
                    },
                  ),
                ),

              ),
              CircularMarquee(
                child: Icon(Icons.cloud, size: 128, color: Color(0xF7FFF87F)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
