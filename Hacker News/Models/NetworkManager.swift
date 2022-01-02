//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Hassan Abdulwahab on 01/01/2022.
//

import Foundation
//the ObservableObject protocols allows a class to be able to broadcast one or many of its properties to any interested observer
class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]() //creat an empty array of posts that can be published to any intrested observer
    
    func fetchData() {
        //create Url
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            //creat UrlSession with default config
            let session = URLSession(configuration: .default)
            //create session task that takes a url request and a completion handler
            let task = session.dataTask(with: url) { data, urlResponse, error in
                //if no error occur while requesting data
                if error == nil {
                    //create a json dececoder which will be used to decode the json response that will be received back
                    let jsonDecoder = JSONDecoder()
                            //use the jsonDecoder to decode the retrieved to the Results struct
                    if let safeData = data {
                        do {
                            //because the jsonDecoder.decode can throw, we have to try the decode operation and use a do/catch block to catch any errors that it may throw if something goes wrong while trying to decode the retrieved data
                            let results = try jsonDecoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                //dispatch events to the main thread since this operation occur in a closure which runs in a background thread and may take a while to return result
                                self.posts = results.hits //assign the value of results.hits which contains is an array of retrieved posts to posts
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume() //start the task
        }
    }
}
