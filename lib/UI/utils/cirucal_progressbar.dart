import 'package:behtrino_test/constant/color_repository.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            spinnerDuration: 1500,
            size: 50,
            customColors: CustomSliderColors(
                dynamicGradient: true,
                progressBarColors: [
                  colorOfCircularProgress,
                  colorOfCircularProgress
                ],
                trackColors: [colorBackOfCircularProgress,colorBackOfCircularProgress],
                dotColor: const Color(0xffEA005E)),
            spinnerMode: true,
          )),
    );
  }
}
