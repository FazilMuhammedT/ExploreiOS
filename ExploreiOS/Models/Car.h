//
//  Car.h
//  ExploreiOS
//
//  http://www.raywenderlich.com/45940/intro-object-oriented-design-part-1
//
//  Created by Fazil T on 01/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "Vehicle.h"

@interface Car : Vehicle
@property (nonatomic, assign) BOOL      isConvertible;
@property (nonatomic, assign) BOOL      isHatchback;
@property (nonatomic, assign) BOOL      hasSunroof;
@property (nonatomic, assign) NSInteger numberOfDoors;

@end
