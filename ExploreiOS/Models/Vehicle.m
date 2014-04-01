//
//  Vehicle.m
//  ExploreiOS
//
//  http://www.raywenderlich.com/45940/intro-object-oriented-design-part-1
//  http://www.raywenderlich.com/45942/intro-object-oriented-design-part-2
//
//  Created by Fazil T on 01/04/14.
//  Copyright (c) 2014 Learning. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

-(NSString *)goForward
{
    return nil;
}

-(NSString *)goBackward
{
    return nil;
}

-(NSString *)stopMoving
{
    return nil;
}

-(NSString *)turn:(NSInteger)degrees
{
    //Since there are only 360 degrees in a circle, calculate what a single turn would be.
    NSInteger degreesInACircle = 360;
    
    if (degrees > degreesInACircle || degrees < -degreesInACircle) {
        //The % operator returns the remainder after dividing.
        degrees = degrees % degreesInACircle;
    }
    
    return [NSString stringWithFormat:@"Turn %d degrees.", degrees];
}

-(NSString *)changeGears:(NSString *)newGearName
{
    return [NSString stringWithFormat:@"Put %@ into %@ gear.", self.modelName, newGearName];
}

-(NSString *)makeNoise
{
    return nil;
}

#pragma mark - Convenience Methods

-(NSString *)vehicleTitleString
{
    return [NSString stringWithFormat:@"%d %@ %@", self.modelYear, self.brandName, self.modelName];
}
-(NSString *)vehicleDetailsString
{
    //Setup the basic details string based on the properties in the base Vehicle class.
    NSMutableString *basicDetailsString = [NSMutableString string];
    [basicDetailsString appendString:@"Basic vehicle details:\n\n"];
    [basicDetailsString appendFormat:@"Brand name: %@\n", self.brandName];
    [basicDetailsString appendFormat:@"Model name: %@\n", self.modelName];
    [basicDetailsString appendFormat:@"Model year: %d\n", self.modelYear];
    [basicDetailsString appendFormat:@"Power source: %@\n", self.powerSource];
    [basicDetailsString appendFormat:@"# of wheels: %d", self.numberOfWheels];
    
    return [basicDetailsString copy];
    //return basicDetailsString;
}

#pragma mark - Factory method

+ (instancetype)vehicleWithBrandName:(NSString *)brandName modelName:(NSString *)modelName modelYear:(NSInteger)modelYear powerSource:(NSString *)powerSource wheels:(NSInteger)numberOfWheels;
{
    //Use self in the superclass to ensure you're getting the proper return type for each of the subclasses.
    Vehicle *newVehicle = [[self alloc] init];
    
    //Set the provided values to the appropriate instance variables.
    newVehicle.brandName = brandName;
    newVehicle.modelName = modelName;
    newVehicle.modelYear = modelYear;
    newVehicle.powerSource = powerSource;
    newVehicle.numberOfWheels = numberOfWheels;
    
    //Return the newly created instance.
    return newVehicle;
}


@end
