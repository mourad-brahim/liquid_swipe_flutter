import 'package:flutter/material.dart';
import 'package:liquid_swipe/Clippers/CircularWave.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';

import '../Clippers/WaveLayer.dart';

/// This class reveals the next page in the liquid wave form.

class PageReveal extends StatelessWidget {
  final double revealPercent;
  final Widget child;
  final SlideDirection slideDirection;
  final double iconPosition;
  final WaveType waveType;

  //Constructor
  PageReveal({this.revealPercent,
    this.child,
    this.slideDirection,
    this.iconPosition,
    this.waveType });

  @override
  Widget build(BuildContext context) {
    //ClipPath clips our Container (page) with clipper based on path..
    switch (waveType) {
      case WaveType.liquidReveal:
        return ClipPath(
          clipper: WaveLayer(
              revealPercent: slideDirection == SlideDirection.leftToRight
                  ? 1.0 - revealPercent
                  : revealPercent,
              slideDirection: slideDirection,
              iconPosition: iconPosition),
          child: child,
        );
        break;
      case WaveType.circularReveal:
        return ClipPath(
          clipper: CircularWave(iconPosition,
              revealPercent: slideDirection == SlideDirection.leftToRight
                  ? 1.0 - revealPercent
                  : revealPercent),
          child: child,
        );
        break;
      default:
        return ClipPath(
          clipper: WaveLayer(
              revealPercent: slideDirection == SlideDirection.leftToRight
                  ? 1.0 - revealPercent
                  : revealPercent,
              slideDirection: slideDirection,
              iconPosition: iconPosition),
          child: child,
        );
        break;
    }
  }
}
