// To parse this JSON data, do
//
//     final presentation = presentationFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

Future<Presentation> backgroundPresentationFromJson(String str) =>
    compute(presentationFromJson, str);

Presentation presentationFromJson(String str) =>
    Presentation.fromJson(json.decode(str));

String presentationToJson(Presentation data) => json.encode(data.toJson());

class Presentation {
  num slideWidth;
  num slideHeight;
  num fontScaleFactor;
  String projectBgColor;
  String projectSlideListBgColor;
  String projectSlideListHighlightColor;
  bool showDebugContainers;
  bool animateSlideTransitions;
  bool autoAdvance;
  num autoAdvanceDurationMillis;
  List<Slide> slides;

  Presentation({
    this.slideWidth,
    this.slideHeight,
    this.fontScaleFactor,
    this.projectBgColor,
    this.projectSlideListBgColor,
    this.projectSlideListHighlightColor,
    this.showDebugContainers,
    this.animateSlideTransitions,
    this.autoAdvance,
    this.autoAdvanceDurationMillis,
    this.slides,
  });

  Presentation copyWith({
    num slideWidth,
    num slideHeight,
    num fontScaleFactor,
    String projectBgColor,
    String projectSlideListBgColor,
    String projectSlideListHighlightColor,
    bool showDebugContainers,
    bool animateSlideTransitions,
    bool autoAdvance,
    num autoAdvanceDurationMillis,
    List<Slide> slides,
  }) =>
      Presentation(
        slideWidth: slideWidth ?? this.slideWidth,
        slideHeight: slideHeight ?? this.slideHeight,
        fontScaleFactor: fontScaleFactor ?? this.fontScaleFactor,
        projectBgColor: projectBgColor ?? this.projectBgColor,
        projectSlideListBgColor:
            projectSlideListBgColor ?? this.projectSlideListBgColor,
        projectSlideListHighlightColor: projectSlideListHighlightColor ??
            this.projectSlideListHighlightColor,
        showDebugContainers: showDebugContainers ?? this.showDebugContainers,
        animateSlideTransitions:
            animateSlideTransitions ?? this.animateSlideTransitions,
        autoAdvance: autoAdvance ?? this.autoAdvance,
        autoAdvanceDurationMillis:
            autoAdvanceDurationMillis ?? this.autoAdvanceDurationMillis,
        slides: slides ?? this.slides,
      );

  factory Presentation.fromJson(Map<String, dynamic> json) => Presentation(
        slideWidth: json["slide_width"],
        slideHeight: json["slide_height"],
        fontScaleFactor: json["font_scale_factor"],
        projectBgColor: json["project_bg_color"],
        projectSlideListBgColor: json["project_slide_list_bg_color"],
        projectSlideListHighlightColor:
            json["project_slide_list_highlight_color"],
        showDebugContainers: json["show_debug_containers"],
        animateSlideTransitions: json["animate_slide_transitions"],
        autoAdvance: json["auto_advance"],
        autoAdvanceDurationMillis: json["auto_advance_duration_millis"],
        slides: List<Slide>.from(json["slides"].map((x) => Slide.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slide_width": slideWidth,
        "slide_height": slideHeight,
        "font_scale_factor": fontScaleFactor,
        "project_bg_color": projectBgColor,
        "project_slide_list_bg_color": projectSlideListBgColor,
        "project_slide_list_highlight_color": projectSlideListHighlightColor,
        "show_debug_containers": showDebugContainers,
        "animate_slide_transitions": animateSlideTransitions,
        "auto_advance": autoAdvance,
        "auto_advance_duration_millis": autoAdvanceDurationMillis,
        "slides": List<dynamic>.from(slides.map((x) => x.toJson())),
      };
}

class Slide {
  String bgColor;
  List<Content> content;
  num advancementCount;
  bool animatedTransition;

  Slide({
    this.bgColor,
    this.content,
    this.advancementCount,
    this.animatedTransition,
  });

  Slide copyWith({
    String bgColor,
    List<Content> content,
    num advancementCount,
    bool animatedTransition,
  }) =>
      Slide(
        bgColor: bgColor ?? this.bgColor,
        content: content ?? this.content,
        advancementCount: advancementCount ?? this.advancementCount,
        animatedTransition: animatedTransition ?? this.animatedTransition,
      );

  factory Slide.fromJson(Map<String, dynamic> json) => Slide(
        bgColor: json["bg_color"] == null ? null : json["bg_color"],
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        advancementCount: json["advancement_count"] == null
            ? null
            : json["advancement_count"],
        animatedTransition: json["animated_transition"] == null
            ? null
            : json["animated_transition"],
      );

  Map<String, dynamic> toJson() => {
        "bg_color": bgColor == null ? null : bgColor,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "advancement_count": advancementCount == null ? null : advancementCount,
        "animated_transition":
            animatedTransition == null ? null : animatedTransition,
      };
}

class Content {
  String type;
  num x;
  num y;
  num height;
  num width;
  num scrollTo;
  dynamic lineHeight;
  List<String> wordList;
  num rowCount;
  num columnCount;
  bool shuffleInitial;
  num seed;
  num minShownDurationMilliseconds;
  num extraShownDurationMaxMilliseconds;
  num blinkDurationMilliseconds;
  List<String> colors;
  List<String> photoFiles;
  String file;
  Animation animation;
  bool debugOverflow;
  bool debugLock;
  num debugLockedControllerPosition;
  num debugLockedStageValue;
  num titleFontSizeMin;
  num titleFontSizeMax;
  num subtitleFontSizeMin;
  num subtitleFontSizeMax;
  num subtilePaddingTop;
  num orbSize;
  String orbImagePath;
  num controllerDuration;
  Beautiful beautiful;
  Beautiful fast;
  Beautiful productive;
  Productive2 productive2;
  Beautiful open;
  String fit;
  bool evict;
  String fill;
  String text;
  dynamic fontSize;
  String align;
  String fontColor;
  dynamic letterSpacing;
  String textAlign;
  num delayInMilliseconds;
  String fontFamily;
  bool strikeThrough;
  String asset;
  String animationName;
  num defaultPage;
  bool debugColors;
  num initChangeDurationMillis;
  num pageChangeDurationMillis;
  num pageChangeAnimationDurationMillis;
  String pageChangeCurve;
  num imageHeightMin;
  num imageHeightMax;
  num containerHeightMin;
  num containerHeightMax;
  num viewportFraction;
  num titleTopPadding;
  String titleFontColor;
  List<CellDatum> cellData;
  num advancementStep;

  Content({
    this.type,
    this.x,
    this.y,
    this.height,
    this.width,
    this.scrollTo,
    this.lineHeight,
    this.wordList,
    this.rowCount,
    this.columnCount,
    this.shuffleInitial,
    this.seed,
    this.minShownDurationMilliseconds,
    this.extraShownDurationMaxMilliseconds,
    this.blinkDurationMilliseconds,
    this.colors,
    this.photoFiles,
    this.file,
    this.animation,
    this.debugOverflow,
    this.debugLock,
    this.debugLockedControllerPosition,
    this.debugLockedStageValue,
    this.titleFontSizeMin,
    this.titleFontSizeMax,
    this.subtitleFontSizeMin,
    this.subtitleFontSizeMax,
    this.subtilePaddingTop,
    this.orbSize,
    this.orbImagePath,
    this.controllerDuration,
    this.beautiful,
    this.fast,
    this.productive,
    this.productive2,
    this.open,
    this.fit,
    this.evict,
    this.fill,
    this.text,
    this.fontSize,
    this.align,
    this.fontColor,
    this.letterSpacing,
    this.textAlign,
    this.delayInMilliseconds,
    this.fontFamily,
    this.strikeThrough,
    this.asset,
    this.animationName,
    this.defaultPage,
    this.debugColors,
    this.initChangeDurationMillis,
    this.pageChangeDurationMillis,
    this.pageChangeAnimationDurationMillis,
    this.pageChangeCurve,
    this.imageHeightMin,
    this.imageHeightMax,
    this.containerHeightMin,
    this.containerHeightMax,
    this.viewportFraction,
    this.titleTopPadding,
    this.titleFontColor,
    this.cellData,
    this.advancementStep,
  });

  Content copyWith({
    String type,
    num x,
    num y,
    num height,
    num width,
    num scrollTo,
    dynamic lineHeight,
    List<String> wordList,
    num rowCount,
    num columnCount,
    bool shuffleInitial,
    num seed,
    num minShownDurationMilliseconds,
    num extraShownDurationMaxMilliseconds,
    num blinkDurationMilliseconds,
    List<String> colors,
    List<String> photoFiles,
    String file,
    Animation animation,
    bool debugOverflow,
    bool debugLock,
    num debugLockedControllerPosition,
    num debugLockedStageValue,
    num titleFontSizeMin,
    num titleFontSizeMax,
    num subtitleFontSizeMin,
    num subtitleFontSizeMax,
    num subtilePaddingTop,
    num orbSize,
    String orbImagePath,
    num controllerDuration,
    Beautiful beautiful,
    Beautiful fast,
    Beautiful productive,
    Productive2 productive2,
    Beautiful open,
    String fit,
    bool evict,
    String fill,
    String text,
    dynamic fontSize,
    String align,
    String fontColor,
    dynamic letterSpacing,
    String textAlign,
    num delayInMilliseconds,
    String fontFamily,
    bool strikeThrough,
    String asset,
    String animationName,
    num defaultPage,
    bool debugColors,
    num initChangeDurationMillis,
    num pageChangeDurationMillis,
    num pageChangeAnimationDurationMillis,
    String pageChangeCurve,
    num imageHeightMin,
    num imageHeightMax,
    num containerHeightMin,
    num containerHeightMax,
    num viewportFraction,
    num titleTopPadding,
    String titleFontColor,
    List<CellDatum> cellData,
    num advancementStep,
  }) =>
      Content(
        type: type ?? this.type,
        x: x ?? this.x,
        y: y ?? this.y,
        height: height ?? this.height,
        width: width ?? this.width,
        scrollTo: scrollTo ?? this.scrollTo,
        lineHeight: lineHeight ?? this.lineHeight,
        wordList: wordList ?? this.wordList,
        rowCount: rowCount ?? this.rowCount,
        columnCount: columnCount ?? this.columnCount,
        shuffleInitial: shuffleInitial ?? this.shuffleInitial,
        seed: seed ?? this.seed,
        minShownDurationMilliseconds:
            minShownDurationMilliseconds ?? this.minShownDurationMilliseconds,
        extraShownDurationMaxMilliseconds: extraShownDurationMaxMilliseconds ??
            this.extraShownDurationMaxMilliseconds,
        blinkDurationMilliseconds:
            blinkDurationMilliseconds ?? this.blinkDurationMilliseconds,
        colors: colors ?? this.colors,
        photoFiles: photoFiles ?? this.photoFiles,
        file: file ?? this.file,
        animation: animation ?? this.animation,
        debugOverflow: debugOverflow ?? this.debugOverflow,
        debugLock: debugLock ?? this.debugLock,
        debugLockedControllerPosition:
            debugLockedControllerPosition ?? this.debugLockedControllerPosition,
        debugLockedStageValue:
            debugLockedStageValue ?? this.debugLockedStageValue,
        titleFontSizeMin: titleFontSizeMin ?? this.titleFontSizeMin,
        titleFontSizeMax: titleFontSizeMax ?? this.titleFontSizeMax,
        subtitleFontSizeMin: subtitleFontSizeMin ?? this.subtitleFontSizeMin,
        subtitleFontSizeMax: subtitleFontSizeMax ?? this.subtitleFontSizeMax,
        subtilePaddingTop: subtilePaddingTop ?? this.subtilePaddingTop,
        orbSize: orbSize ?? this.orbSize,
        orbImagePath: orbImagePath ?? this.orbImagePath,
        controllerDuration: controllerDuration ?? this.controllerDuration,
        beautiful: beautiful ?? this.beautiful,
        fast: fast ?? this.fast,
        productive: productive ?? this.productive,
        productive2: productive2 ?? this.productive2,
        open: open ?? this.open,
        fit: fit ?? this.fit,
        evict: evict ?? this.evict,
        fill: fill ?? this.fill,
        text: text ?? this.text,
        fontSize: fontSize ?? this.fontSize,
        align: align ?? this.align,
        fontColor: fontColor ?? this.fontColor,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        textAlign: textAlign ?? this.textAlign,
        delayInMilliseconds: delayInMilliseconds ?? this.delayInMilliseconds,
        fontFamily: fontFamily ?? this.fontFamily,
        strikeThrough: strikeThrough ?? this.strikeThrough,
        asset: asset ?? this.asset,
        animationName: animationName ?? this.animationName,
        defaultPage: defaultPage ?? this.defaultPage,
        debugColors: debugColors ?? this.debugColors,
        initChangeDurationMillis:
            initChangeDurationMillis ?? this.initChangeDurationMillis,
        pageChangeDurationMillis:
            pageChangeDurationMillis ?? this.pageChangeDurationMillis,
        pageChangeAnimationDurationMillis: pageChangeAnimationDurationMillis ??
            this.pageChangeAnimationDurationMillis,
        pageChangeCurve: pageChangeCurve ?? this.pageChangeCurve,
        imageHeightMin: imageHeightMin ?? this.imageHeightMin,
        imageHeightMax: imageHeightMax ?? this.imageHeightMax,
        containerHeightMin: containerHeightMin ?? this.containerHeightMin,
        containerHeightMax: containerHeightMax ?? this.containerHeightMax,
        viewportFraction: viewportFraction ?? this.viewportFraction,
        titleTopPadding: titleTopPadding ?? this.titleTopPadding,
        titleFontColor: titleFontColor ?? this.titleFontColor,
        cellData: cellData ?? this.cellData,
        advancementStep: advancementStep ?? this.advancementStep,
      );

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        type: json["type"],
        x: json["x"],
        y: json["y"],
        height: json["height"],
        width: json["width"],
        scrollTo: json["scroll_to"] == null ? null : json["scroll_to"],
        lineHeight: json["line_height"],
        wordList: json["word_list"] == null
            ? null
            : List<String>.from(json["word_list"].map((x) => x)),
        rowCount: json["row_count"] == null ? null : json["row_count"],
        columnCount: json["column_count"] == null ? null : json["column_count"],
        shuffleInitial:
            json["shuffle_initial"] == null ? null : json["shuffle_initial"],
        seed: json["seed"] == null ? null : json["seed"],
        minShownDurationMilliseconds:
            json["min_shown_duration_milliseconds"] == null
                ? null
                : json["min_shown_duration_milliseconds"],
        extraShownDurationMaxMilliseconds:
            json["extra_shown_duration_max_milliseconds"] == null
                ? null
                : json["extra_shown_duration_max_milliseconds"],
        blinkDurationMilliseconds: json["blink_duration_milliseconds"] == null
            ? null
            : json["blink_duration_milliseconds"],
        colors: json["colors"] == null
            ? null
            : List<String>.from(json["colors"].map((x) => x)),
        photoFiles: json["photo_files"] == null
            ? null
            : List<String>.from(json["photo_files"].map((x) => x)),
        file: json["file"] == null ? null : json["file"],
        animation: json["animation"] == null
            ? null
            : Animation.fromJson(json["animation"]),
        debugOverflow:
            json["debug_overflow"] == null ? null : json["debug_overflow"],
        debugLock: json["debug_lock"] == null ? null : json["debug_lock"],
        debugLockedControllerPosition:
            json["debug_locked_controller_position"] == null
                ? null
                : json["debug_locked_controller_position"],
        debugLockedStageValue: json["debug_locked_stage_value"] == null
            ? null
            : json["debug_locked_stage_value"],
        titleFontSizeMin: json["title_font_size_min"] == null
            ? null
            : json["title_font_size_min"],
        titleFontSizeMax: json["title_font_size_max"] == null
            ? null
            : json["title_font_size_max"],
        subtitleFontSizeMin: json["subtitle_font_size_min"] == null
            ? null
            : json["subtitle_font_size_min"],
        subtitleFontSizeMax: json["subtitle_font_size_max"] == null
            ? null
            : json["subtitle_font_size_max"],
        subtilePaddingTop: json["subtile_padding_top"] == null
            ? null
            : json["subtile_padding_top"],
        orbSize: json["orb_size"] == null ? null : json["orb_size"],
        orbImagePath:
            json["orb_image_path"] == null ? null : json["orb_image_path"],
        controllerDuration: json["controller_duration"] == null
            ? null
            : json["controller_duration"],
        beautiful: json["beautiful"] == null
            ? null
            : Beautiful.fromJson(json["beautiful"]),
        fast: json["fast"] == null ? null : Beautiful.fromJson(json["fast"]),
        productive: json["productive"] == null
            ? null
            : Beautiful.fromJson(json["productive"]),
        productive2: json["productive2"] == null
            ? null
            : Productive2.fromJson(json["productive2"]),
        open: json["open"] == null ? null : Beautiful.fromJson(json["open"]),
        fit: json["fit"] == null ? null : json["fit"],
        evict: json["evict"] == null ? null : json["evict"],
        fill: json["fill"] == null ? null : json["fill"],
        text: json["text"] == null ? null : json["text"],
        fontSize: json["font_size"],
        align: json["align"] == null ? null : json["align"],
        fontColor: json["font_color"] == null ? null : json["font_color"],
        letterSpacing: json["letter_spacing"],
        textAlign: json["text_align"] == null ? null : json["text_align"],
        delayInMilliseconds: json["delay_in_milliseconds"] == null
            ? null
            : json["delay_in_milliseconds"],
        fontFamily: json["font_family"] == null ? null : json["font_family"],
        strikeThrough:
            json["strike_through"] == null ? null : json["strike_through"],
        asset: json["asset"] == null ? null : json["asset"],
        animationName:
            json["animation_name"] == null ? null : json["animation_name"],
        defaultPage: json["default_page"] == null ? null : json["default_page"],
        debugColors: json["debug_colors"] == null ? null : json["debug_colors"],
        initChangeDurationMillis: json["init_change_duration_millis"] == null
            ? null
            : json["init_change_duration_millis"],
        pageChangeDurationMillis: json["page_change_duration_millis"] == null
            ? null
            : json["page_change_duration_millis"],
        pageChangeAnimationDurationMillis:
            json["page_change_animation_duration_millis"] == null
                ? null
                : json["page_change_animation_duration_millis"],
        pageChangeCurve: json["page_change_curve"] == null
            ? null
            : json["page_change_curve"],
        imageHeightMin:
            json["image_height_min"] == null ? null : json["image_height_min"],
        imageHeightMax:
            json["image_height_max"] == null ? null : json["image_height_max"],
        containerHeightMin: json["container_height_min"] == null
            ? null
            : json["container_height_min"],
        containerHeightMax: json["container_height_max"] == null
            ? null
            : json["container_height_max"],
        viewportFraction: json["viewport_fraction"] == null
            ? null
            : json["viewport_fraction"],
        titleTopPadding: json["title_top_padding"] == null
            ? null
            : json["title_top_padding"],
        titleFontColor:
            json["title_font_color"] == null ? null : json["title_font_color"],
        cellData: json["cell_data"] == null
            ? null
            : List<CellDatum>.from(
                json["cell_data"].map((x) => CellDatum.fromJson(x))),
        advancementStep:
            json["advancement_step"] == null ? null : json["advancement_step"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "x": x,
        "y": y,
        "height": height,
        "width": width,
        "scroll_to": scrollTo == null ? null : scrollTo,
        "line_height": lineHeight,
        "word_list": wordList == null
            ? null
            : List<dynamic>.from(wordList.map((x) => x)),
        "row_count": rowCount == null ? null : rowCount,
        "column_count": columnCount == null ? null : columnCount,
        "shuffle_initial": shuffleInitial == null ? null : shuffleInitial,
        "seed": seed == null ? null : seed,
        "min_shown_duration_milliseconds": minShownDurationMilliseconds == null
            ? null
            : minShownDurationMilliseconds,
        "extra_shown_duration_max_milliseconds":
            extraShownDurationMaxMilliseconds == null
                ? null
                : extraShownDurationMaxMilliseconds,
        "blink_duration_milliseconds": blinkDurationMilliseconds == null
            ? null
            : blinkDurationMilliseconds,
        "colors":
            colors == null ? null : List<dynamic>.from(colors.map((x) => x)),
        "photo_files": photoFiles == null
            ? null
            : List<dynamic>.from(photoFiles.map((x) => x)),
        "file": file == null ? null : file,
        "animation": animation == null ? null : animation.toJson(),
        "debug_overflow": debugOverflow == null ? null : debugOverflow,
        "debug_lock": debugLock == null ? null : debugLock,
        "debug_locked_controller_position":
            debugLockedControllerPosition == null
                ? null
                : debugLockedControllerPosition,
        "debug_locked_stage_value":
            debugLockedStageValue == null ? null : debugLockedStageValue,
        "title_font_size_min":
            titleFontSizeMin == null ? null : titleFontSizeMin,
        "title_font_size_max":
            titleFontSizeMax == null ? null : titleFontSizeMax,
        "subtitle_font_size_min":
            subtitleFontSizeMin == null ? null : subtitleFontSizeMin,
        "subtitle_font_size_max":
            subtitleFontSizeMax == null ? null : subtitleFontSizeMax,
        "subtile_padding_top":
            subtilePaddingTop == null ? null : subtilePaddingTop,
        "orb_size": orbSize == null ? null : orbSize,
        "orb_image_path": orbImagePath == null ? null : orbImagePath,
        "controller_duration":
            controllerDuration == null ? null : controllerDuration,
        "beautiful": beautiful == null ? null : beautiful.toJson(),
        "fast": fast == null ? null : fast.toJson(),
        "productive": productive == null ? null : productive.toJson(),
        "productive2": productive2 == null ? null : productive2.toJson(),
        "open": open == null ? null : open.toJson(),
        "fit": fit == null ? null : fit,
        "evict": evict == null ? null : evict,
        "fill": fill == null ? null : fill,
        "text": text == null ? null : text,
        "font_size": fontSize,
        "align": align == null ? null : align,
        "font_color": fontColor == null ? null : fontColor,
        "letter_spacing": letterSpacing,
        "text_align": textAlign == null ? null : textAlign,
        "delay_in_milliseconds":
            delayInMilliseconds == null ? null : delayInMilliseconds,
        "font_family": fontFamily == null ? null : fontFamily,
        "strike_through": strikeThrough == null ? null : strikeThrough,
        "asset": asset == null ? null : asset,
        "animation_name": animationName == null ? null : animationName,
        "default_page": defaultPage == null ? null : defaultPage,
        "debug_colors": debugColors == null ? null : debugColors,
        "init_change_duration_millis":
            initChangeDurationMillis == null ? null : initChangeDurationMillis,
        "page_change_duration_millis":
            pageChangeDurationMillis == null ? null : pageChangeDurationMillis,
        "page_change_animation_duration_millis":
            pageChangeAnimationDurationMillis == null
                ? null
                : pageChangeAnimationDurationMillis,
        "page_change_curve": pageChangeCurve == null ? null : pageChangeCurve,
        "image_height_min": imageHeightMin == null ? null : imageHeightMin,
        "image_height_max": imageHeightMax == null ? null : imageHeightMax,
        "container_height_min":
            containerHeightMin == null ? null : containerHeightMin,
        "container_height_max":
            containerHeightMax == null ? null : containerHeightMax,
        "viewport_fraction": viewportFraction == null ? null : viewportFraction,
        "title_top_padding": titleTopPadding == null ? null : titleTopPadding,
        "title_font_color": titleFontColor == null ? null : titleFontColor,
        "cell_data": cellData == null
            ? null
            : List<dynamic>.from(cellData.map((x) => x.toJson())),
        "advancement_step": advancementStep == null ? null : advancementStep,
      };
}

class Animation {
  String curve;
  num delayInMilliseconds;
  num durationInMilliseconds;
  num offsetX;
  num opacityStart;
  num opacityEnd;
  String scaleAlign;
  num scaleStart;
  num scaleEnd;
  num offsetY;
  String type;

  Animation({
    this.curve,
    this.delayInMilliseconds,
    this.durationInMilliseconds,
    this.offsetX,
    this.opacityStart,
    this.opacityEnd,
    this.scaleAlign,
    this.scaleStart,
    this.scaleEnd,
    this.offsetY,
    this.type,
  });

  Animation copyWith({
    String curve,
    num delayInMilliseconds,
    num durationInMilliseconds,
    num offsetX,
    num opacityStart,
    num opacityEnd,
    String scaleAlign,
    num scaleStart,
    num scaleEnd,
    num offsetY,
    String type,
  }) =>
      Animation(
        curve: curve ?? this.curve,
        delayInMilliseconds: delayInMilliseconds ?? this.delayInMilliseconds,
        durationInMilliseconds:
            durationInMilliseconds ?? this.durationInMilliseconds,
        offsetX: offsetX ?? this.offsetX,
        opacityStart: opacityStart ?? this.opacityStart,
        opacityEnd: opacityEnd ?? this.opacityEnd,
        scaleAlign: scaleAlign ?? this.scaleAlign,
        scaleStart: scaleStart ?? this.scaleStart,
        scaleEnd: scaleEnd ?? this.scaleEnd,
        offsetY: offsetY ?? this.offsetY,
        type: type ?? this.type,
      );

  factory Animation.fromJson(Map<String, dynamic> json) => Animation(
        curve: json["curve"],
        delayInMilliseconds: json["delay_in_milliseconds"] == null
            ? null
            : json["delay_in_milliseconds"],
        durationInMilliseconds: json["duration_in_milliseconds"],
        offsetX: json["offset_x"] == null ? null : json["offset_x"],
        opacityStart:
            json["opacity_start"] == null ? null : json["opacity_start"],
        opacityEnd: json["opacity_end"] == null ? null : json["opacity_end"],
        scaleAlign: json["scale_align"] == null ? null : json["scale_align"],
        scaleStart: json["scale_start"] == null ? null : json["scale_start"],
        scaleEnd: json["scale_end"] == null ? null : json["scale_end"],
        offsetY: json["offset_y"] == null ? null : json["offset_y"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "curve": curve,
        "delay_in_milliseconds":
            delayInMilliseconds == null ? null : delayInMilliseconds,
        "duration_in_milliseconds": durationInMilliseconds,
        "offset_x": offsetX == null ? null : offsetX,
        "opacity_start": opacityStart == null ? null : opacityStart,
        "opacity_end": opacityEnd == null ? null : opacityEnd,
        "scale_align": scaleAlign == null ? null : scaleAlign,
        "scale_start": scaleStart == null ? null : scaleStart,
        "scale_end": scaleEnd == null ? null : scaleEnd,
        "offset_y": offsetY == null ? null : offsetY,
        "type": type == null ? null : type,
      };
}

class Beautiful {
  String backgroundColor;
  String titleColor;
  String subtitleColor;
  String imageShellPath;
  String imageInnardsPath;
  String title;
  String subtitle;
  String innerBgColor;
  Positions backgroundPositions;
  Positions titlePositions;
  ShellImageOffset shellImageOffset;
  InnerImage shellImage;
  InnerImage innerImage;
  bool shellOnTop;
  String shellFit;

  Beautiful({
    this.backgroundColor,
    this.titleColor,
    this.subtitleColor,
    this.imageShellPath,
    this.imageInnardsPath,
    this.title,
    this.subtitle,
    this.innerBgColor,
    this.backgroundPositions,
    this.titlePositions,
    this.shellImageOffset,
    this.shellImage,
    this.innerImage,
    this.shellOnTop,
    this.shellFit,
  });

  Beautiful copyWith({
    String backgroundColor,
    String titleColor,
    String subtitleColor,
    String imageShellPath,
    String imageInnardsPath,
    String title,
    String subtitle,
    String innerBgColor,
    Positions backgroundPositions,
    Positions titlePositions,
    ShellImageOffset shellImageOffset,
    InnerImage shellImage,
    InnerImage innerImage,
    bool shellOnTop,
    String shellFit,
  }) =>
      Beautiful(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        titleColor: titleColor ?? this.titleColor,
        subtitleColor: subtitleColor ?? this.subtitleColor,
        imageShellPath: imageShellPath ?? this.imageShellPath,
        imageInnardsPath: imageInnardsPath ?? this.imageInnardsPath,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        innerBgColor: innerBgColor ?? this.innerBgColor,
        backgroundPositions: backgroundPositions ?? this.backgroundPositions,
        titlePositions: titlePositions ?? this.titlePositions,
        shellImageOffset: shellImageOffset ?? this.shellImageOffset,
        shellImage: shellImage ?? this.shellImage,
        innerImage: innerImage ?? this.innerImage,
        shellOnTop: shellOnTop ?? this.shellOnTop,
        shellFit: shellFit ?? this.shellFit,
      );

  factory Beautiful.fromJson(Map<String, dynamic> json) => Beautiful(
        backgroundColor: json["background_color"],
        titleColor: json["title_color"],
        subtitleColor: json["subtitle_color"],
        imageShellPath: json["image_shell_path"],
        imageInnardsPath: json["image_innards_path"],
        title: json["title"],
        subtitle: json["subtitle"],
        innerBgColor: json["inner_bg_color"],
        backgroundPositions: Positions.fromJson(json["background_positions"]),
        titlePositions: Positions.fromJson(json["title_positions"]),
        shellImageOffset: ShellImageOffset.fromJson(json["shell_image_offset"]),
        shellImage: InnerImage.fromJson(json["shell_image"]),
        innerImage: InnerImage.fromJson(json["inner_image"]),
        shellOnTop: json["shell_on_top"] == null ? null : json["shell_on_top"],
        shellFit: json["shell_fit"] == null ? null : json["shell_fit"],
      );

  Map<String, dynamic> toJson() => {
        "background_color": backgroundColor,
        "title_color": titleColor,
        "subtitle_color": subtitleColor,
        "image_shell_path": imageShellPath,
        "image_innards_path": imageInnardsPath,
        "title": title,
        "subtitle": subtitle,
        "inner_bg_color": innerBgColor,
        "background_positions": backgroundPositions.toJson(),
        "title_positions": titlePositions.toJson(),
        "shell_image_offset": shellImageOffset.toJson(),
        "shell_image": shellImage.toJson(),
        "inner_image": innerImage.toJson(),
        "shell_on_top": shellOnTop == null ? null : shellOnTop,
        "shell_fit": shellFit == null ? null : shellFit,
      };
}

class Positions {
  ShellImageOffset collapsed;
  ShellImageOffset beautiful;
  ShellImageOffset fast;
  ShellImageOffset productive;
  ShellImageOffset open;

  Positions({
    this.collapsed,
    this.beautiful,
    this.fast,
    this.productive,
    this.open,
  });

  Positions copyWith({
    ShellImageOffset collapsed,
    ShellImageOffset beautiful,
    ShellImageOffset fast,
    ShellImageOffset productive,
    ShellImageOffset open,
  }) =>
      Positions(
        collapsed: collapsed ?? this.collapsed,
        beautiful: beautiful ?? this.beautiful,
        fast: fast ?? this.fast,
        productive: productive ?? this.productive,
        open: open ?? this.open,
      );

  factory Positions.fromJson(Map<String, dynamic> json) => Positions(
        collapsed: ShellImageOffset.fromJson(json["collapsed"]),
        beautiful: ShellImageOffset.fromJson(json["beautiful"]),
        fast: ShellImageOffset.fromJson(json["fast"]),
        productive: ShellImageOffset.fromJson(json["productive"]),
        open: ShellImageOffset.fromJson(json["open"]),
      );

  Map<String, dynamic> toJson() => {
        "collapsed": collapsed.toJson(),
        "beautiful": beautiful.toJson(),
        "fast": fast.toJson(),
        "productive": productive.toJson(),
        "open": open.toJson(),
      };
}

class ShellImageOffset {
  num top;
  num left;

  ShellImageOffset({
    this.top,
    this.left,
  });

  ShellImageOffset copyWith({
    num top,
    num left,
  }) =>
      ShellImageOffset(
        top: top ?? this.top,
        left: left ?? this.left,
      );

  factory ShellImageOffset.fromJson(Map<String, dynamic> json) =>
      ShellImageOffset(
        top: json["top"],
        left: json["left"],
      );

  Map<String, dynamic> toJson() => {
        "top": top,
        "left": left,
      };
}

class InnerImage {
  num top;
  num left;
  num height;
  num width;

  InnerImage({
    this.top,
    this.left,
    this.height,
    this.width,
  });

  InnerImage copyWith({
    num top,
    num left,
    num height,
    num width,
  }) =>
      InnerImage(
        top: top ?? this.top,
        left: left ?? this.left,
        height: height ?? this.height,
        width: width ?? this.width,
      );

  factory InnerImage.fromJson(Map<String, dynamic> json) => InnerImage(
        top: json["top"],
        left: json["left"],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "top": top,
        "left": left,
        "height": height,
        "width": width,
      };
}

class CellDatum {
  String title;
  String filepath;

  CellDatum({
    this.title,
    this.filepath,
  });

  CellDatum copyWith({
    String title,
    String filepath,
  }) =>
      CellDatum(
        title: title ?? this.title,
        filepath: filepath ?? this.filepath,
      );

  factory CellDatum.fromJson(Map<String, dynamic> json) => CellDatum(
        title: json["title"],
        filepath: json["filepath"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "filepath": filepath,
      };
}

class Productive2 {
  String innardsBgColor;
  InnerImage innardsBg;

  Productive2({
    this.innardsBgColor,
    this.innardsBg,
  });

  Productive2 copyWith({
    String innardsBgColor,
    InnerImage innardsBg,
  }) =>
      Productive2(
        innardsBgColor: innardsBgColor ?? this.innardsBgColor,
        innardsBg: innardsBg ?? this.innardsBg,
      );

  factory Productive2.fromJson(Map<String, dynamic> json) => Productive2(
        innardsBgColor: json["innards_bg_color"],
        innardsBg: InnerImage.fromJson(json["innards_bg"]),
      );

  Map<String, dynamic> toJson() => {
        "innards_bg_color": innardsBgColor,
        "innards_bg": innardsBg.toJson(),
      };
}
