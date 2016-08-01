//: [Previous](@previous)

import Foundation
import UIKit
import ImageIO

/// Resize an image based on a scale factor
func resize(image: UIImage, scale: CGFloat) -> UIImage {
  let size = CGSizeApplyAffineTransform(image.size, CGAffineTransformMakeScale(scale,scale))
  let hasAlpha = true
  
  // Automatically use scale factor of main screen
  let scale: CGFloat = 0.0
  
  UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
  image.drawInRect(CGRect(origin: CGPointZero, size: size))
  let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
  UIGraphicsEndImageContext()
  return scaledImage
}


if let image = UIImage(named: "pokemon") {
  let scaledImage = resize(image, scale: 0.1)
}


//: [Next](@next)
