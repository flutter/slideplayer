import 'dart:math' as math;
import 'package:flutter_slides/content/slide_content_factory.dart';
import 'package:flutter_slides/models/normalization_multipliers.dart';
import 'package:flutter_slides/models/slide.dart';
import 'package:flutter_slides/models/slides.dart';
import 'package:flutter_slides/content/animated_content_widget.dart';
import 'package:flutter/material.dart';

class SlidePageController {
  _SlidePageControllerListener listener;

  final _isPlayingListener = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isPlayingListener => _isPlayingListener;
  bool get isPresenting => _isPlayingListener.value;

  void exit() {
    _isPlayingListener.value = false;
  }

  void start() {
    _isPlayingListener.value = true;
  }

  bool advanceSlideContent() {
    if (listener != null) {
      return listener.onAdvanceSlideContent();
    }
    return false;
  }

  bool reverseSlideContent() {
    if (listener != null) {
      return listener.onReverseSlideContent();
    }
    return false;
  }
}

abstract class _SlidePageControllerListener {
  bool onAdvanceSlideContent();
  bool onReverseSlideContent();
}

class SlidePage extends StatefulWidget {
  SlidePage({
    Key key,
    @required this.slide,
    this.controller,
    this.index,
    this.isPreview = false,
  }) : super(key: key ?? ObjectKey(slide));

  final Slide slide;
  final SlidePageController controller;
  final int index;
  final bool isPreview;

  @override
  SlidePageState createState() => SlidePageState();
}

class SlidePageState extends State<SlidePage>
    with TickerProviderStateMixin
    implements _SlidePageControllerListener {
  ValueNotifier<int> _slideAdvancementNotifier;
  int _slideAdvancementCount = 0;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller.listener = this;
    }
    _slideAdvancementNotifier = ValueNotifier(_slideAdvancementCount);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double aspectRatio = widget.slide.slideFactors.normalizationWidth /
        widget.slide.slideFactors.normalizationHeight;
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double slideWidth = constraints.biggest.width;
          double slideHeight = constraints.biggest.height;
          return Material(
            elevation: 4.0,
            color: widget.slide.backgroundColor,
            child: Stack(
              children: List<Widget>.generate(
                widget.slide.content.length,
                (index) {
                  Map contentMap = widget.slide.content[index];
                  int step = (contentMap['advancement_step'] as int ?? -1)
                      .clamp(0, widget.slide.advancementCount);
                  if (widget.controller != null &&
                      _slideAdvancementCount < step) {
                    return Container();
                  }
                  bool justRevealed = _slideAdvancementCount == step;
                  return _SlidePageScaledPositioned(
                    map: contentMap,
                    slideWidth: slideWidth,
                    slideHeight: slideHeight,
                    normalizationWidth:
                        widget.slide.slideFactors.normalizationWidth,
                    normalizationHeight:
                        widget.slide.slideFactors.normalizationHeight,
                    child: _generateContent(
                        slideWidth, slideHeight, contentMap, justRevealed),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _generateContent(double slideWidth, double slideHeight, Map contentMap,
      bool justRevealed) {
    final multis = NormalizationMultipliers(
      width: slideWidth / widget.slide.slideFactors.normalizationWidth,
      height: slideHeight / widget.slide.slideFactors.normalizationHeight,
      font: slideWidth / widget.slide.slideFactors.fontScaleFactor,
    );
    final String type = contentMap['type'];
    Widget contentWidget = SlideContentFactory().generate(
        type, contentMap, widget.isPreview, multis, _slideAdvancementNotifier);
    final rotationDegrees = contentMap['rotation'] ?? 0;
    if (loadedSlides.showDebugContainers) {
      contentWidget = Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.red,
              width: 2.0 *
                  slideWidth /
                  widget.slide.slideFactors.normalizationWidth),
        ),
        child: contentWidget,
      );
    }

    contentWidget = RotationTransition(
      turns: AlwaysStoppedAnimation(rotationDegrees / 360),
      child: contentWidget,
    );
    if (contentMap.containsKey('animation')) {
      contentWidget = AnimatedContentWidget(
        child: contentWidget,
        dataMap: contentMap['animation'],
        normalizationWidthMultiplier:
            slideWidth / widget.slide.slideFactors.normalizationWidth,
        normalizationHeightMultiplier:
            slideHeight / widget.slide.slideFactors.normalizationHeight,
        completeAnimation: widget.isPreview || widget.controller == null,
      );
    }
    if (contentMap.containsKey('opacity')) {
      contentWidget = Opacity(
        opacity: contentMap['opacity'],
        child: contentWidget,
      );
    }
    return contentWidget;
  }

  @override
  bool onAdvanceSlideContent() {
    if (_slideAdvancementCount + 1 > widget.slide.advancementCount) {
      return false;
    } else {
      setState(() {
        _slideAdvancementNotifier.value += 1;
        _slideAdvancementCount += 1;
      });
      return true;
    }
  }

  @override
  bool onReverseSlideContent() {
    if (_slideAdvancementCount - 1 < widget.slide.advancementCount) {
      return false;
    } else {
      setState(() {
        _slideAdvancementNotifier.value -= 1;
        _slideAdvancementCount -= 1;
      });
      return true;
    }
  }
}

class _SlidePageScaledPositioned extends StatelessWidget {
  final Map map;
  final double normalizationWidth;
  final double normalizationHeight;
  final double slideWidth;
  final double slideHeight;
  final Widget child;

  const _SlidePageScaledPositioned({
    Key key,
    @required this.map,
    @required this.slideWidth,
    @required this.slideHeight,
    @required this.child,
    @required this.normalizationWidth,
    @required this.normalizationHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double x = (map['x'] as num).toDouble();
    double y = (map['y'] as num).toDouble();
    double width = (map['width'] as num).toDouble();
    double height = (map['height'] as num).toDouble();
    return Positioned(
      left: ((x / normalizationWidth) * slideWidth).toDouble(),
      top: ((y / normalizationHeight) * slideHeight).toDouble(),
      width: (slideWidth * (width / normalizationWidth)).toDouble(),
      height: (slideHeight * (height / normalizationHeight)).toDouble(),
      child: child,
    );
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return math.sin(t * math.pi * 2);
  }
}
