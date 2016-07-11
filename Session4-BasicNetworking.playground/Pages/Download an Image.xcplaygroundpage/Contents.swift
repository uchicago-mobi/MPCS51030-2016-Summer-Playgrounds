import Foundation
import XCPlayground
import UIKit

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: Download an image using `NSURLSession`
//: ======================================

// String representation of the URL to retrieve Issues
let urlString = "http://kittentoob.com/wp-content/uploads/sites/4/2014/11/Extremely-cute-kitten_large.jpg"

// Create an NSURL object from the string.  There are no advanced
// configurations on this `NSURL`
guard let url = NSURL(string: urlString) else {
  fatalError("Unable to create NSURL from string")
}

// Create a vanilla url session
let session = NSURLSession.sharedSession()

// Create a simple data task that will download the `URL` content
// in the background.  The `data`, `response`, and `error` will
// be returned in the trailing closure.  Note that the variables
// returned in the closure are all `Optional` type
let task = session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
  
  // Print out the response
  print("Response: \(response)")

  // Ensure we received a valid response from the server
  guard ((response as! NSHTTPURLResponse).statusCode == 200)  else {
    fatalError("Bad response from server")
  }
  
  // Ensure there were no errors returned from the request. Note that we are
  // using guard to check a condition, not unwrap an optional
  guard error == nil else {
    fatalError("Error: \(error!.localizedDescription): \(error!.userInfo)")
  }
  
  // Ensure there is data from the response and unwrap it
  guard let data = data else {
    fatalError("Data is nil")
  }
  
  // We received the raw data, but its not too useful yet
  print("Raw data: \(data)")
  
  // Create a `UIImage` from the recieved data
  let image = UIImage(data: data)
  
})


// Tasks start off in suspended state, we need to kick it off
task.resume()