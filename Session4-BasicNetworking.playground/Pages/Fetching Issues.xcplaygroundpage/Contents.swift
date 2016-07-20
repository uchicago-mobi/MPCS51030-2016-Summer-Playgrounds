//: [Previous](@previous)

import Foundation
import XCPlayground

// Tell playground we want to continue execution after page is done
// excecuting
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true




/// The array of dictionaries that will hold all of our issues
var issues:[[String: AnyObject]]?



//: > Why this doesn't work?
/*
 func getIssues(url: String) -> [[String: AnyObject]]? {
 
 // Download on background thread
 // return will be called before the operation completes
 }
 */



/// Retrieve class Issues using GitHub API v3
/// - Attributions: Assignment write-up
/// - Parameter url: A `String` of the url
/// - Parameter completion: A closure to run on the converted JSON
/// - Returns: An `Array` of `Dictionary` objects
func getIssues(url: String, completion:([[String: AnyObject]]?) -> Void) {
  
  // Download the issues
  // Pass back the array of dictionaries in the completion block
  //completion()
  guard let url = NSURL(string: url) else {
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
      
      // Pay Attention
      completion(issues)
      
    } catch {
      print("error serializing JSON: \(error)")
    }
  })
  // Tasks start off in suspended state, we need to kick it off
  task.resume()
}




/// Get all the issues from GitHub. The issues will be returned as `issues` in the closure.
/// This would be a great place to update the table view showing the issues.  Remember that
/// any UIKit elements need to be updated on the main thread.
getIssues("https://api.github.com/repos/uchicago-mobi/2016-Summer-Forum/issues?state=open") { (issues) in

  // The data is available in this closure through the `issues` variable

  // Copy the `issues` to a property of the view controller.  The property should
  // be of the same type as the parameter here (eg [[String: AnyObject]]?)
  
  // Reload the table.  The tables data source should be the property you copied the
  // issues to (above). Remember to refresh the table on the main thread
  dispatch_async(dispatch_get_main_queue()) {
      // Anything in here is execute on the main thread
      // You should reload your table here.
    //tableView.reload()
    
  }

}


//: [Next](@next)
