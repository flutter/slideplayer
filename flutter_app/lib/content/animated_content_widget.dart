import 'package:flutter_slides/utils/curve_utils.dart' as CurveUtils;
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_slides/utils/align_utils.dart' as AlignUtils;

class AnimatedContentWidget extends StatefulWidget {
  final Widget child;
  final int duration;
  final int delay;
  final Offset offset;
  final Tween<double> scale;
  final double rotation;
  final Alignment scaleAlignment;
  final Curve curve;
  final Tween<double> opacity;
  final bool completeAnimation;

  AnimatedContentWidget({
    Key key,
    @required this.child,
    @required Map dataMap,
    @required double normalizationWidthMultiplier,
    @required double normalizationHeightMultiplier,
    @required this.completeAnimation,
  })  : duration = dataMap['duration_in_milliseconds'] ?? 0,
        delay = dataMap['delay_in_milliseconds'] ?? 0,
        offset = Offset(
          (dataMap['offset_x'] ?? 0.0) * normalizationWidthMultiplier,
          (dataMap['offset_y'] ?? 0.0) * normalizationHeightMultiplier,
        ),
        opacity = Tween<double>(
          begin: dataMap['opacity_start'] ?? 1.0,
          end: dataMap['opacity_end'] ?? 1.0,
        ),
        scale = Tween<double>(
            begin: dataMap['scale_start'] ?? 1.0,
            end: dataMap['scale_end'] ?? 1.0),
        scaleAlignment = AlignUtils.alignmentFromString(
          dataMap['scale_align'],
          defaultAlignment: Alignment.center,
        ),
        rotation = (dataMap['rotation'] ?? 0.0) * (math.pi / 180.0),
        curve = CurveUtils.curveFromString(dataMap['curve']),
        super(key: key);
  @override
  _AnimatedContentWidgetState createState() => _AnimatedContentWidgetState();
}

class _AnimatedContentWidgetState extends State<AnimatedContentWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _opacityAnimation;
  Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
    _opacityAnimation = widget.opacity.animate(_animation);
    _scaleAnimation = widget.scale.animate(_animation);
    if (widget.completeAnimation) {
      _controller.value = 1.0;
    } else {
      try {
        Future.delayed(Duration(milliseconds: widget.delay)).then((_) {
          if (mounted) _controller?.forward(from: 0.0);
        });
      } on TickerCanceled {
        // the animation got canceled, probably because we were disposed
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: widget.offset * _animation.value,
            child: Transform.rotate(
              angle: widget.rotation * _animation.value,
              child: Transform.scale(
                alignment: widget.scaleAlignment,
                scale: _scaleAnimation.value,
                child: child,
              ),
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}
