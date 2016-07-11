//: [Previous](@previous)


//: Download and parse JSON
//: =======================

import Foundation
import XCPlayground

// Tell playground we want to continue execution after page is done
// excecuting
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


// String representation of the URL to retrieve Issues
let urlString = "https://api.github.com/repos/uchicago-mobi/2016-Summer-Forum/issues?state=open"

guard let url = NSURL(string: urlString) else {
  fatalError("Unable to create NSURL from string")
}

// Create a vanilla url session
let session = NSURLSession.sharedSession()

// Create a data task
let task = session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
  
  // Print out the response
  print("Response: \(response)")
  
  // Ensure there were no errors returned from the request
  guard error == nil else {
    print("error: \(error!.localizedDescription): \(error!.userInfo)")
    fatalError("Error: \(error!.localizedDescription)")
  }
  
  // Ensure there is data and unwrap it
  guard let data = data else {
    fatalError("Data is nil")
  }
  
  // We received data but it needs to be processed
  print("Raw data: \(data)")
  
  // Serialize the raw data into JSON using `NSJSONSerialization`.  The "do-let" is
  // part of 
  do {
    let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
    print(json)
    
    // Cast JSON as an array of dictionaries
    guard let issues = json as? [[String: AnyObject]] else {
      fatalError("We couldn't cast the JSON to an array of dictionaries")
    }

    // Iterate through the issues and print out the author and title
    for issue in issues {
      if let title = issue["title"] as? String,
        user = issue["user"]!["login"] as? String {
          print("\(user) - \(title)")
      }
    }

    
    
  } catch {
    print("error serializing JSON: \(error)")
  }
})

// Tasks start off in suspended state, we need to kick it off
task.resume()


//: [Next](@next)
