//
//  Album+TableRepresentation.m
//  ExploreiOS
//
//  http://www.raywenderlich.com/46988/ios-design-patterns
//
//  Created by Fazil T on 03/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

/*
 
 The Decorator Design Pattern
 The Decorator pattern dynamically adds behaviors and responsibilities to an object without modifying its code. It’s an alternative to subclassing where you modify a class’ behavior by wrapping it with another object.
 In Objective-C there are two very common implementations of this pattern: Category and Delegation.

 Category
 Category is an extremely powerful mechanism that allows you to add methods to existing classes without subclassing. The new methods are added at compile time and can be executed like normal methods of the extended class. It’s slightly different from the classic definition of a decorator, because a Category doesn’t hold an instance of the class it extends.
 
 */

#import "Album+TableRepresentation.h"

@implementation Album (TableRepresentation)

- (NSDictionary*)trTableRepresentation
{
    return @{@"titles":@[@"Artist", @"Album", @"Genre", @"Year"],
             @"values":@[self.artist, self.title, self.genre, self.year]};
}


@end
