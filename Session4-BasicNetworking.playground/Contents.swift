import Foundation
import XCPlayground
import UIKit

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


let kBookmark = "kBookMark"

var defaults = NSUserDefaults.standardUserDefaults()
defaults.setValue("http://google.com", forKey: kBookmark)
defaults.synchronize()

//let readDefaults = NSUserDefaults.standardUserDefaults()
defaults.dictionaryRepresentation()

defaults.valueForKey("kBookmark") as? String


///: Download data

///: Downl


if let url = NSURL(string: "http://www.betches.com/sites/default/files/article/list/images/onfle.jpg") {
  
      
// Create session
//    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
//    config.HTTPAdditionalHeaders = @{
//    @"Content-Type":@"application/json",
//    @"Accept":@"application/json",
//    @"SR_API_KEY":@"vVetwDogzE"};
//

  let session = NSURLSession.sharedSession()
  
  let task = session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
  guard error == nil else { return  }
  
    if error != nil {
      print("error: \(error!.localizedDescription): \(error!.userInfo)")
    } else if data != nil {
      print(data)
      
      do {
    
        let image = UIImage(data: data!)
/*


        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
       
        print(json)
        if let issues = json as? [String: AnyObject] {
          //completion(issues)
        }
        */
      } catch {
        print("error serializing JSON: \(error)")
        //completion(nil)
      }
      
      
      
    }
  })
  
  task.resume()
}
else {
  print("Unable to create NSURL")
}


//var paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true) as [String]
  
