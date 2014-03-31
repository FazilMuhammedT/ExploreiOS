//
//  Person.m
//  ExploreiOS
//
//  Logic based on
//  http://www.raywenderlich.com/40293/learn-to-code-ios-apps-2-strings-arrays-objects-and-classes
//
//  Created by Fazil T on 31/03/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)addPersonInfo:(NSDictionary *)person{
    firstName = person[@"firstName"];
    lastName = person[@"lastName"];
    NSString *ageString = person[@"age"];
    age = ageString.integerValue;
}
- (void)printPersonInfo{
    
    NSLog(@"%@ %@ is %i years old", firstName, lastName, age);
}

@end
