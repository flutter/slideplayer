import 'dart:io';

import 'package:flutter_slides/models/slides.dart';
import 'package:flutter_slides/slides/slide_presentation.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride, kIsWeb;
import 'package:flutter/material.dart';

import 'package:file_chooser/file_chooser.dart' as file_chooser;
import 'package:menubar/menubar.dart';
import 'package:scoped_model/scoped_model.dart';

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
  setApplicationMenu([
    Submenu(label: 'File', children: [
      MenuItem(
          label: 'Open',
          onClicked: () {
            file_chooser.showOpenPanel((result, paths) {
              if (paths != null) {
                FlutterSlidesModel().loadSlidesData(paths.first);
              }
            }, allowsMultipleSelection: false);
          }),
    ]),
  ]);
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<FlutterSlidesModel>(
      model: loadedSlides,
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'GoogleSans',
        ),
        home: SlidePresentation(),
      ),
    );
  }
}
