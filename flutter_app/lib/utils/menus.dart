import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menubar/menubar.dart';

import '../models/slides.dart';

final fileMenu = Submenu(label: 'File', children: [
  MenuItem(
    label: 'Open',
    shortcut: LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyO),
    onClicked: () => loadSlideDataFromFileChooser(),
  ),
]);

void setUpMenus() {
  setApplicationMenu([
    fileMenu,
  ]);
}
