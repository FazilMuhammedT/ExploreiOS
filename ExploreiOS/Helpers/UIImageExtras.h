//
//  UIImageExtras.h
//  ScaryBugs
//
//  Created by Ray Wenderlich on 8/23/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//
//  http://www.raywenderlich.com/1845/ios-tutorial-how-to-create-a-simple-iphone-app-tutorial-part-2
//

#import <Foundation/Foundation.h>

@interface UIImage (Extras)

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end

