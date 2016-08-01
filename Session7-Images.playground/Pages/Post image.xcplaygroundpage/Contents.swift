//: Playground - noun: a place where people can play

import UIKit

//: Warning: This does not work in Playgrounds
//:

func uploadRequest(user: NSString, image: UIImage, caption: NSString){

  let boundary = generateBoundaryString()
  let scaledImage = resize(image)
  let imageJPEGData = UIImageJPEGRepresentation(scaledImage,0.1)
  
  guard let imageData = imageJPEGData else {return}
  
  // Create the URL, the user should be unique
  let url = NSURL(string: "http://stachesandglasses.appspot.com/post/\(user)/")

  // Create the request
  let request = NSMutableURLRequest(URL: url!)
  request.HTTPMethod = "POST"
  request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
  
  // Set the type of the data being sent
  let mimetype = "image/jpeg"
  // This is not necessary
  let fileName = "test.png"
  
  // Create data for the body
  let body = NSMutableData()
  body.appendData("\r\n--\(boundary)\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
  
  // Caption data
  body.appendData("Content-Disposition:form-data; name=\"caption\"\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
  body.appendData("CaptionText\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
  
  // Image data
  body.appendData("--\(boundary)\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
  body.appendData("Content-Disposition:form-data; name=\"image\"; filename=\"\(fname)\"\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
  body.appendData("Content-Type: \(mimetype)\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
  body.appendData(imageData)
  body.appendData("\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
  
  // Trailing boundary
  body.appendData("--\(boundary)--\r\n".dataUsingEncoding(NSUTF8StringEncoding)!)
  
  // Set the body in the request
  request.HTTPBody = body
  
  // Create a data task
  let session = NSURLSession.sharedSession()
  let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
    // Need more robust errory handling here
    // 200 response is successful post
    print(response!)
    print(error)
    
    // The data returned is the update JSON list of all the images
    let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
    print(dataString)
  }
  
  task.resume()
}

/// A unique string that signifies breaks in the posted data
func generateBoundaryString() -> String {
  return "Boundary-\(NSUUID().UUIDString)"
}