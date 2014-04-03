//
//  ScaryBugData.h
//  ExploreiOS
//
//  http://www.raywenderlich.com/1797/ios-tutorial-how-to-create-a-simple-iphone-app-part-1
//
//  Created by Fazil T on 03/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

//  ScaryBugData: Contains bug name and rating.

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject
@property (strong) NSString *title;
@property (assign) float rating;

- (id)initWithTitle:(NSString*)title rating:(float)rating;

@end
