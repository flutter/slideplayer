import 'package:flutter/material.dart';

Map<String, Curve> _curveMap = {
  'linear': Curves.linear,
  'decelerate': Curves.decelerate,
  'ease': Curves.ease,
  'easeIn': Curves.easeIn,
  'easeOut': Curves.easeOut,
  'easeInOut': Curves.easeInOut,
  'fastOutSlowIn': Curves.easeInOut,
  'topCenter': Curves.fastOutSlowIn,
  'bounceIn': Curves.bounceIn,
  'bounceOut': Curves.bounceOut,
  'bounceInOut': Curves.bounceInOut,
  'elasticIn': Curves.elasticIn,
  'elasticOut': Curves.elasticOut,
  'elasticInOut': Curves.elasticInOut,
};

Curve curveFromString(String string) {
  return _curveMap[string ?? ''] ?? Curves.linear;
}
