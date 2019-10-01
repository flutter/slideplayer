import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_slides/models/slide.dart';
import 'package:flutter_slides/models/slide_factors.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watcher/watcher.dart';
import 'package:flutter_slides/utils/color_utils.dart' as ColorUtils;
import 'package:file_chooser/file_chooser.dart' as file_chooser;

FlutterSlidesModel loadedSlides = FlutterSlidesModel();

const _RECENTLY_OPENED_FILE_PREFS_KEY = 'last_opened_file_path';

void loadSlideDataFromFileChooser() {
  file_chooser.showOpenPanel((result, paths) {
    if (paths != null) {
      _loadSlidesData(paths.first);
    }
  }, allowsMultipleSelection: false);
}

void loadRecentlyOpenedSlideData() {
  SharedPreferences.getInstance().then(
    (prefs) {
      String filePath = prefs.getString(_RECENTLY_OPENED_FILE_PREFS_KEY);
      if (filePath != null) {
        _loadSlidesData(filePath);
      }
    },
  );
}

void _loadSlidesData(String filePath) {
  loadedSlides.loadSlidesData(filePath);
}

class FlutterSlidesModel extends Model {
  List<Slide> slides;
  String externalFilesRoot;
  double slideWidth = 1920.0;
  double slideHeight = 1080.0;
  double fontScaleFactor = 1920.0;
  Color projectBGColor = Color(0xFFF0F0F0);
  Color slidesListBGColor = Color(0xFFDDDDDD);
  Color slidesListHighlightColor = Color(0xFF40C4FF);
  bool animateSlideTransitions = false;
  bool showDebugContainers = false;
  bool autoAdvance = false;
  int autoAdvanceDurationMillis = 30000;

  StreamSubscription _slidesFileSubscription;
  StreamSubscription _replaceFileSubscription;

  void loadSlidesData(String filePath) {
    _slidesFileSubscription?.cancel();
    _replaceFileSubscription?.cancel();
    _slidesFileSubscription = Watcher(filePath).events.listen((event) {
      loadSlidesData(filePath);
      notifyListeners();
    });
    try {
      String fileString = File(filePath).readAsStringSync();
      final replaceFilePath =
          File(File(filePath).parent.path + '/replace_values.json').path;
      final replaceFile = File(replaceFilePath);
      if (replaceFile.existsSync()) {
        String replaceFileString = replaceFile.readAsStringSync();
        Map replaceJSON = jsonDecode(replaceFileString);
        for (final entry in replaceJSON.entries) {
          fileString = fileString.replaceAll(
              "\"@replace/${entry.key}\"", entry.value.toString());
        }
        _replaceFileSubscription =
            Watcher(replaceFilePath).events.listen((event) {
          loadSlidesData(filePath);
          notifyListeners();
        });
      }
      Map json = jsonDecode(fileString);
      loadedSlides.slideWidth = (json['slide_width'] ?? 1920.0).toDouble();
      loadedSlides.slideHeight = (json['slide_height'] ?? 1080.0).toDouble();
      loadedSlides.fontScaleFactor =
          (json['font_scale_factor'] ?? loadedSlides.slideWidth).toDouble();
      loadedSlides.projectBGColor =
          ColorUtils.colorFromString(json['project_bg_color']) ??
              loadedSlides.projectBGColor;
      loadedSlides.slidesListBGColor =
          ColorUtils.colorFromString(json['project_slide_list_bg_color']) ??
              loadedSlides.slidesListBGColor;
      loadedSlides.slidesListHighlightColor = ColorUtils.colorFromString(
              json['project_slide_list_highlight_color']) ??
          loadedSlides.slidesListHighlightColor;
      loadedSlides.animateSlideTransitions =
          json['animate_slide_transitions'] ?? false;
      loadedSlides.showDebugContainers = json['show_debug_containers'] ?? false;
      loadedSlides.externalFilesRoot = json['external_files_root'] ??
          File(filePath).parent.path + '/external_files';
      loadedSlides.autoAdvance = json['auto_advance'] ?? false;
      loadedSlides.autoAdvanceDurationMillis =
          json['auto_advance_duration_millis'] ?? 30000;

      imageCache.maximumSize;
      SlideFactors slideFactors = SlideFactors(
        normalizationWidth: loadedSlides.slideWidth,
        normalizationHeight: loadedSlides.slideHeight,
        fontScaleFactor: loadedSlides.fontScaleFactor,
      );
      List slides = json['slides'];
      List<Slide> slideList = [];
      for (Map slide in slides) {
        List contentList = slide['content'];
        int advancementCount = slide['advancement_count'] ?? 0;
        bool animatedTransition = slide['animated_transition'] ?? false;
        Color slideBGColor =
            ColorUtils.colorFromString(slide['bg_color'] ?? '0xFFFFFFFF');
        slideList.add(
          Slide(
              content: contentList,
              slideFactors: slideFactors,
              advancementCount: advancementCount,
              backgroundColor: slideBGColor,
              animatedTransition: animatedTransition),
        );
      }
      loadedSlides.slides = slideList;
      loadedSlides.notifyListeners();
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString(_RECENTLY_OPENED_FILE_PREFS_KEY, filePath);
      });
    } catch (e) {
      print("Error loading slides file: $e");
    }
  }
}
