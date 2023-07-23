//
//  ContentView.swift
//  swift-concurrency-by-example
//
//  Created by Anthony Benitez-Rodriguez on 7/23/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            HStack {
                TextField("Website address", text: $viewModel.site)
                    .textFieldStyle(.roundedBorder)
                Button("Go") {
                    /// You can use Task to trigger an async call from a synchronous function
                    Task {
                        await viewModel.fetchSource()
                    }
                }
            }
            .padding()
            
            .task {
                /// .task can also trigger an async task. It will run away from main thread. Note that @State pro
            }

            ScrollView {
                Text(viewModel.sourceCode)
            }
        }
    }
}

/// You can also execute async from simple command-line programs using the @main attribute.
/*
 func processWeather() async {
     // Do async work here
 }

 @main
 struct MainApp {
     static func main() async {
         await processWeather()
     }
 }
 */
