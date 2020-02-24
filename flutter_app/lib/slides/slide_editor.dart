import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/slides.dart';
import 'slide_page.dart';

class SlideEditor extends StatefulWidget {
  @override
  _SlideEditorState createState() => _SlideEditorState();
}

class _SlideEditorState extends State<SlideEditor>
    with TickerProviderStateMixin {
  AnimationController _slideListController;
  double _lastSlideListScrollOffset = 0.0;
  int _currentSlideIndex = 0;

  @override
  void initState() {
    _slideListController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterSlidesModel model =
        Provider.of<FlutterSlidesModel>(context, listen: true);
    return Container(
      child: Column(
        children: <Widget>[
          Material(
            elevation: 4.0,
            child: Row(
              children: [
                Spacer(),
                RaisedButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: () => model.setPresentationMode(true),
                ),
              ],
            ),
          ),
          Container(height: 2.0),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 300,
                  child: _slideList(model),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _slideList(FlutterSlidesModel model) {
    return Container(
      width: 200.0,
      color: model.slidesListBGColor,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _lastSlideListScrollOffset = notification.metrics.pixels;
          return true;
        },
        child: ListView.builder(
          controller: ScrollController(
            initialScrollOffset: _lastSlideListScrollOffset,
          ),
          itemCount: model.slides.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTapDown: (details) {
                if (mounted) {
                  setState(() {
                    _currentSlideIndex = index;
                  });
                }
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _currentSlideIndex != index
                            ? Colors.transparent
                            : model.slidesListHighlightColor,
                        width: 4.0,
                      ),
                    ),
                    child: SlidePage(
                      isPreview: true,
                      slide: model.slides[index],
                    ),
                  ),
                  Positioned(
                    bottom: 6.0,
                    left: 6.0,
                    child: Container(
                      height: 20.0,
                      child: Material(
                        color: model.slidesListHighlightColor.withOpacity(0.75),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              '$index',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontFamily: "RobotoMono"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
