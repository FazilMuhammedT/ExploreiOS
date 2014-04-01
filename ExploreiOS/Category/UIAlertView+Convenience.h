//
//  UIAlertView+Convenience.h
//  ExploreiOS
//
//  http://www.raywenderlich.com/45942/intro-object-oriented-design-part-2
//
//  Created by Fazil T on 01/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Convenience)

// Shows a UIAlertView with the given title and message, and an OK button to dismiss it.
+ (void)showSimpleAlertWithTitle:(NSString *)title andMessage:(NSString *)message;

@end

/* 
 From Apple’s Cocoa Fundamentals guide’s section on Cocoa Design Patterns:
 
 The Decorator design pattern attaches additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality. As does subclassing, adaptation of the Decorator pattern allows you to incorporate new behavior without modifying existing code. Decorators wrap an object of the class whose behavior they extend.

 The primary example of the Decorator pattern in Objective-C is the use of Categories.

 Categories are a special kind of class in iOS that allow you to add additional methods to classes without having to subclass or alter the original class. They’re primarily used for adding methods to the stock UIKit components that come with iOS.

 The difference between a category and a subclass is pretty simple: A category allows you to add new methods, but not override existing methods. You can’t add new properties or instance variables to categories – you can only use existing ones. If you want to add a new property or instance variable, you’ll need to create a subclass and use the power of inheritance to create your additional properties and methods.

*/