//
//  Chapter2.swift
//  swift-concurrency-by-example
//
//  Created by Anthony Benitez-Rodriguez on 7/23/23.
//

import Foundation

/*
 Synchronous vs Asynchronous
 
 A synchronous function is one that executes all its work in a simple, straight line on a single thread. It can request for work that happens in other threads, but the function itself will always run on a single thread. An A function that also executes B, C and D functions will all run on a single thread as a stack, waiting for the latest pushed functions on the stack frame to finish to then pop them and continue. That means that A is blocked until B finished, and if B calls C, B is blocked until C is finished, for example.
 */
class Chapter2 {
    func synchronousDiceThrow() -> Int {
        return Int.random(in: 1...6)
    }
    
    func asynchronousDiceThrow() async -> Int {
        return Int.random(in: 1...6)
    }
    
    func fetchNews() async -> Data? {
        do {
            let url = URL(string: "https://hws.dev/news-1.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            print("Failed to fetch data")
            return nil
        }
    }
    
    // MARK: - Weather Fetch
    /// await happens asynchronously, so it will not block the thread.
    func processWeather() async {
        let records = await fetchWeatherHistory()
        // anything could happen here
        let average = await calculateAverageTemperature(for: records)
        // or here
        let response = await upload(result: average)
        // or here
        print("Server response: \(response)")
    }
    
    func fetchWeatherHistory() async -> [Double] {
        (1...100_000).map { _ in Double.random(in: -10...30) }
    }

    func calculateAverageTemperature(for records: [Double]) async -> Double {
        let total = records.reduce(0, +)
        let average = total / Double(records.count)
        return average
    }

    func upload(result: Double) async -> String {
        "OK"
    }
    
    // MARK: - Favorites Fetch
    func fetchFavorites() async throws -> [Int] {
        let url = URL(string: "https://hws.dev/user-favorites.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Int].self, from: data)
    }
}
