//
//  flutter_poc_9000App.swift
//  flutter-poc-9000
//
//  Created by Dávid Maróthi on 2024-09-13.
//

import SwiftUI
import Flutter

@Observable
class FlutterDependencies {
    let flutterEngine = FlutterEngine(name: "my flutter engine")
    init() {
        // Runs the default Dart entrypoint with a default Flutter route.
        flutterEngine.run()
    }
}

@main
struct flutter_poc_9000App: App {
    @State var flutterDependencies = FlutterDependencies()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(flutterDependencies)
        }
    }
}
