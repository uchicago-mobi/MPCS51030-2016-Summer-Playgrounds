//
//  ViewController.swift
//  DoNotTry
//
//  Created by T. Andrew Binkowski on 3/4/16.
//  Copyright © 2016 The University of Chicago, Department of Computer Science. All rights reserved.
//

import UIKit

//
// Custom ErrorType
//
enum UserValidationError: ErrorType {
  case Empty
  case MinimumLength
  case Incorrect(message: String)
}


//
//
//
class ViewController: UIViewController {
  
  //
  // MARK: - Lifecycle
  //
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Register to listen for broadcase about default values being set
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: "defaultsChanged",
      name: NSUserDefaultsDidChangeNotification,
      object: nil)
    
    // Stop propogation of errors.
    //let userId = try! self.validateUser("user@email.com", password: "123456")
    //print("\(userId) should be safe to use")
    
    // Handle all error in the same way
    //if let userId = try? self.validateUser("user@email.com", password: "123456") {
    //  print("\(userId) should be safe to use")
    //}

  }
  
  /// Stop listening if the view controller is no longer present
  ///
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  
  //
  // MARK: - IBOutlest
  ///
  
  /// A label that shows the value of name_preference default
  @IBOutlet weak var namePreferenceLabel: UILabel! {
    didSet {
      let namePreference = NSUserDefaults.standardUserDefaults().stringForKey("name_preference")
      namePreferenceLabel.text = "Name Preference: \(namePreference!)"
    }
  }
  
  
  //
  // MARK: - IBACTIONS
  //
  
  /// Handle a tap to open settings
  ///
  @IBAction func tapOpenSettings(sender: UIButton) {
    let settingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
    UIApplication.sharedApplication().openURL(settingsUrl!)
  }
  
  /// Handle a tap where the correct login was used
  ///
  @IBAction func tapCorrectLogin(sender: UIButton) {
    do {
      _ = try self.validateUser("user@email.com", password: "password")
      showAlert("Successful")
    }
    catch UserValidationError.Empty {
      showAlert("Form Empty")
      return
    }
    catch UserValidationError.MinimumLength {
      showAlert("Password too short")
      return
    }
    catch UserValidationError.Incorrect {
      showAlert("Password wrong")
      return
    }
    catch {
      // Swift wants error handling to be exhaustive, so you must take into
      // account an undefined error
    }
  }
  
  
  /// Handle a tap where the login is incorrect
  ///
  @IBAction func tapIncorrectLogin(sender: UIButton) {
    do {
      _ = try self.validateUser("user@email.com", password: "123456")
      showAlert("Successful")
    }
    catch UserValidationError.Empty {
      showAlert("Form Empty")
      return
    }
    catch UserValidationError.MinimumLength {
      showAlert("Password too short")
      return
    }
    catch UserValidationError.Incorrect(let message)  {
      showAlert(message)
      return
    }
    catch {
      // Swift wants error handling to be exhaustive, so you must take into
      // account an undefined error
    }
  }
  
  
  //
  // MARK: - Login Handling
  //
  
  /// Conduct basic validation on the username and password
  /// - Returns:  A `String` of the userId
  /// - Throws: A `UserValidationError`
  ///
  func validateUser(username: String, password: String) throws -> String {
    //
    guard password.characters.count > 0 else {
      throw UserValidationError.Empty
    }
    
    //
    guard password.characters.count >= 6 else {
      throw UserValidationError.MinimumLength
    }
    
    //
    guard password == "password" else {
      throw UserValidationError.Incorrect(message: "Wrong password")
    }
    
    // Lookup userId based on name and password
    // let userId = lookupUserId(username,password)
    return "userId"
  }
  
  /// Show an alert to let the user know about the login state
  ///
  func showAlert(message: String) {
    let alertController = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
    let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alertController.addAction(OKAction)
    self.presentViewController(alertController, animated: true, completion: nil)
  }
  
  
  //
  // MARK: - Notification Center Methods
  //
  
  /// Called when user defaults is changed via a `NSNotification` broadcast.
  /// You don't get information about what was changed, you have to get all
  /// relevant values yourself and then use them accordingly.  In this case, we
  /// update a label on the screen.
  ///
  func defaultsChanged() {
    let namePreference = NSUserDefaults.standardUserDefaults().stringForKey("name_preference")
    namePreferenceLabel.text = "Name Preference: \(namePreference!)"
  }
}



