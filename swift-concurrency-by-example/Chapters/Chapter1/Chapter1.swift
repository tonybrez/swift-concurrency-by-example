//
//  Chapter1.swift
//  swift-concurrency-by-example
//
//  Created by Anthony Benitez-Rodriguez on 7/23/23.
//

import Foundation

/*
 Concurrency vs Parallelism
 
 Quote: “Concurrency is about dealing with many things at once, parallelism is about doing many things at once. Concurrency is a way to structure things so you can maybe use parallelism to do a better job.”
 
 Concurrent: One CPU juggling different operations --_-_-__-
 Parallel: Two CPUs operating at the same time ========
 
 Thread: The smallest unit of execution within a process; a single sequence of scheduled instructions. New threads can be created to handle other operations to not block a thread and keep the UI responsive, like networking, file I/O or heavy computations, but an iOS/macOS/watchOS/tvOS app starts with only one: Main Thread.
 Queue: Abstract data type that follows FIFO principle, like a real-life queue. You can submit blocks of codes to a Task queue to be executed asynchronously. iOS/macOS/watchOS/tvOS app starts with only one: Main Queue.
   - Serial Queue executes tasks one at a time in the order they are added. It will wait wait the provious one finishes to start the next one, so the order is preserved.
   - Concurrent Queues allows multiple tasks to be executed simultaneously, so they can start as soon as their resources become available, but the order of execution is not guaranteed so they can overlap and run concurrently.
 */
class Chapter1 {
    
}
