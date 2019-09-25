// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Cocoa
import FlutterMacOS

class RecentFilesPlugin : NSObject, FlutterPlugin {
  private let channel: FlutterMethodChannel
  static func register(with registrar: FlutterPluginRegistrar) {
  
    let channel = FlutterMethodChannel(name: "FlutterSlides:CustomPlugin",
                                       binaryMessenger: registrar.messenger,
                                       codec: FlutterJSONMethodCodec.sharedInstance())
    let instance = RecentFilesPlugin(channel: channel)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
  
  init(channel: FlutterMethodChannel) {
    self.channel = channel
  }
  
  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "get") {
      let recentFilePath = UserDefaults.standard.string(forKey: "recent")
      result(recentFilePath)
    } else if (call.method == "set") {
      if let recentPath = call.arguments as? String {
        UserDefaults.standard.set(recentPath, forKey: "recent")
      }
      result(nil)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
