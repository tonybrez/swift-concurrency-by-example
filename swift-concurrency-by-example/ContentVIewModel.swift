//
//  ContentVIewModel.swift
//  swift-concurrency-by-example
//
//  Created by Anthony Benitez-Rodriguez on 7/23/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    let chapter2 = Chapter2()
    var site = "https://"
    @Published var sourceCode = ""
    
    func executeFetchNews() async {
        if let data = await chapter2.fetchNews() {
            print("Downloaded \(data.count) bytes")
        } else {
            print("Download failed.")
        }
    }
    
    func executeFetchFavorites() async {
        if let favorites = try? await chapter2.fetchFavorites() {
            print("Fetched \(favorites.count) favorites.")
        } else {
            print("Failed to fetch favorites.")
        }
    }
    
    func fetchSource() async {
        do {
            let url = URL(string: site)!
            let (data, _) = try await URLSession.shared.data(from: url)
            DispatchQueue.main.async {
                self.sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
            }
        } catch {
            sourceCode = "Failed to fetch \(site)"
        }
    }
}
