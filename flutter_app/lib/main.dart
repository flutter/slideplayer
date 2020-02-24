import 'dart:io';

import 'package:flutter_slides/models/slides.dart';
import 'package:flutter_slides/slides/slide_presentation.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride, kIsWeb;
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'utils/menus.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() {
  _enablePlatformOverrideForDesktop();
  WidgetsFlutterBinding.ensureInitialized();
  setUpMenus();
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FlutterSlidesModel>.value(
      value: loadedSlides,
      child: DefaultTextStyle(
        style: TextStyle(fontFamily: 'GoogleSans'),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: const Color(0xFFF0F0F0),
          ),
          darkTheme: ThemeData.dark(),
          home: SlidePresentation(),
        ),
      ),
    );
  }
}
