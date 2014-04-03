//
//  ScaryBugData.m
//  ExploreiOS
//
//  http://www.raywenderlich.com/1797/ios-tutorial-how-to-create-a-simple-iphone-app-part-1
//
//  Created by Fazil T on 03/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

- (id)initWithTitle:(NSString*)title rating:(float)rating {
    if ((self = [super init])) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}

@end
