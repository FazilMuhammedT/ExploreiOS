//
//  Truck.h
//  ExploreiOS
//
//  http://www.raywenderlich.com/45940/intro-object-oriented-design-part-1
//  http://www.raywenderlich.com/45942/intro-object-oriented-design-part-2
//
//  Created by Fazil T on 01/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "Vehicle.h"

@interface Truck : Vehicle
@property (nonatomic, assign) NSInteger cargoCapacityCubicFeet;
//Factory Method
+(Truck *)truckWithBrandName:(NSString *)brandName modelName:(NSString *)modelName modelYear:(NSInteger)modelYear powerSource:(NSString *)powerSource wheels:(NSInteger)numberOfWheels cargoCapacityCubicFeet:(NSInteger)cargoCapacityCubicFeet;
@end
