
//: Playground - noun: a place where people can play

import UIKit
import XCPlayground


/// Note: The broacast name is a constant `kNotificationImageDownloadedKey` that
/// is defined in Constants.swift
let kNotificationImageDownloadedKey = "mobi.uchicago.imageDownloaded"


///
///
///
class ViewController: UIViewController {
  
  /// An image view to be shown in the center of the screen; use computed
  /// properties to set behaviors
  var catImageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
  
  //
  // MARK: - Lifecycle
  //
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set the background color so we can see where the image will go
    catImageView.backgroundColor = UIColor.whiteColor()
    view.addSubview(catImageView)
    
    // Add the notification observer for the lifecycle of the view controller.
    // When the view controller receives the notification, it will call the
    // `imageDownloaded` function.
    NSNotificationCenter.defaultCenter().addObserver(self,
                                                     selector: #selector(ViewController.imageDownloaded(_:)),
                                                     name: kNotificationImageDownloadedKey,
                                                     object: nil)
    
    // Download a big image
    downloadImageWithNotification()
  }
  
  /// Called when the view controller is removed from memory.  This may not be the best
  /// place to remove it.  It is application dependent.
  deinit {
    // Remove the notification observer so it will not be listenting to broadcasts
    // anymore.
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
}

///
///
///
extension ViewController {
  
  /// Download a really big image. Kick off a data task to downloade 
  /// the image.  Announce the download is complete to the 
  /// `NSNotificationCenter` so it can update the `UIImageView`
  func downloadImageWithNotification() {
    // Set the URL (big image of the sky)
    guard let url = NSURL(string: "http://i.imgur.com/XBnuETM.jpg") else {
      print("Probelem with url")
      return
    }
    
    // Retrieve the data from the URL (not a best practice)
    guard let taskData = NSData(contentsOfURL: url) else {
      fatalError("Couldn't get URL")
    }
    
    // Create a UIImage from the response data and pass it to the completion
    // handler
    guard let image = UIImage(data: taskData) else {
      fatalError("Couldn't turn data into an image")
    }
    
    print("☎️ Networking down downloading...")
    
    // Broadcast to notification center that we have the image.  We are 
    // passing the image as the `object` parameter.  There are many 
    // different approaches to accomplish updating your UI from a notification
    NSNotificationCenter.defaultCenter().postNotificationName(kNotificationImageDownloadedKey,
                                                              object: image)
  }
  
  
  /// The method called when the notification is recieved from notification
  /// center.  Cast the `object` to an `UIImage` and then set the image property
  /// of the image view on the screen
  ///
  /// - Parameter notification: A dictionary sent to the receiver
  ///
  func imageDownloaded(notification: NSNotification) {
    print("☎️ Image downloaded with notification: \(notification)")
    let image = notification.object as? UIImage
    
    // Update the image with the passed image
    self.catImageView.image = image
  }
}






///
///
///
let vc = ViewController()

XCPlaygroundPage.currentPage.liveView = vc
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

