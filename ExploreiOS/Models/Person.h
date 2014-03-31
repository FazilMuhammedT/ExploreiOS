//
//  Person.h
//  ExploreiOS
//
//  Created by Fazil T on 31/03/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *firstName;
    NSString *lastName;
    int age;

}

- (void)addPersonInfo:(NSDictionary *)person;
- (void)printPersonInfo;

@end
