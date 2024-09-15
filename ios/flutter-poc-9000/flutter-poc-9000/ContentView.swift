//
//  ContentView.swift
//  flutter-poc-9000
//
//  Created by Dávid Maróthi on 2024-09-13.
//

import SwiftUI
import Flutter

struct FlutterViewControllerRepresentable: UIViewControllerRepresentable {
    let flutterEngine = FlutterEngine(name: "my flutter engine")
    var name: String

   init(name: String) {
        self.name = name
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        let arguments = [self.name]
        flutterEngine.run(
            withEntrypoint: nil,
            libraryURI: nil,
            initialRoute: nil,
            entrypointArgs: arguments
        )

        return FlutterViewController(
            engine: flutterEngine,
            nibName: nil,
            bundle: nil)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct ContentView: View {
    @State private var showSheet = false
    @State private var name: String = ""

    var body: some View {
        VStack {
            Text("Native App")
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button(action: {
                showSheet.toggle()
            }) {
                Text("Next")
            }
            .buttonStyle(.borderedProminent)
            .disabled(name.isEmpty)
        }
        .sheet(isPresented: $showSheet) {
            SheetView(name: name)
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    let name: String

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Circle())
                }
                .padding()
            }

            FlutterViewControllerRepresentable(name: name)
        }
    }
}

#Preview {
    ContentView()
}
