import 'package:flutter_slides/models/normalization_multipliers.dart';
import 'package:flutter_slides/content/rolodex_animation.dart';
import 'package:flutter/material.dart';

class CodingRolodexContent extends StatefulWidget {
  CodingRolodexContent(
      {Key key, this.shouldAnimate = true, @required this.normMultis})
      : super(key: key);

  final bool shouldAnimate;
  final NormalizationMultipliers normMultis;

  @override
  _CodingRolodexContentState createState() => _CodingRolodexContentState();
}

class _CodingRolodexContentState extends State<CodingRolodexContent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final titles = [
      'productive',
      'immediate',
      'fun',
      'responsive',
      'inspiring'
    ];
    final normHeightMulti = widget.normMultis.height;
    final normWidthMulti = widget.normMultis.width;
    final adjustedContainerHeight = normHeightMulti * 300.0;
    return Container(
      child: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: normHeightMulti * 450,
              left: normWidthMulti * 200.0,
              right: 0.0,
              child: Container(
                height: adjustedContainerHeight,
                child: Text(
                  'Coding should be...',
                  style: TextStyle().copyWith(
                    fontSize: normWidthMulti * 110,
                    color: const Color(0xFF1B364F),
                  ),
                ),
              ),
            ),
            Positioned(
              top: normHeightMulti * 320,
              left: normWidthMulti * 1170,
              right: normWidthMulti * 100,
              bottom: normHeightMulti * 100,
              child: Center(
                child: RolodexAnimation(
                  shouldAnimate: widget.shouldAnimate,
                  containerHeight: normHeightMulti * 400.0,
                  titles: titles,
                  textStyle: TextStyle().copyWith(
                    fontSize: normWidthMulti * 110,
                    fontFamily: 'GoogleSans',
                    color: const Color(0xFF1B364F),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
