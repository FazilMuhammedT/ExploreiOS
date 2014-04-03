//
//  ScaryBugDoc.h
//  ExploreiOS
//
//  http://www.raywenderlich.com/1797/ios-tutorial-how-to-create-a-simple-iphone-app-part-1
//
//  Created by Fazil T on 03/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//
//  ScaryBugDoc: Contains full size image, thumbnail image, RWTScaryBugData.

#import <Foundation/Foundation.h>

@class ScaryBugData;

@interface ScaryBugDoc : NSObject
@property (strong) ScaryBugData *data;
@property (strong) UIImage *thumbImage;
@property (strong) UIImage *fullImage;

- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage;

@end
