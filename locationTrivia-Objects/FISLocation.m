//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Madina Ibrahim on 6/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"
#import "FISTrivium.h"    //  ?
@interface FISLocation () //  ?


@end  // ?

@implementation FISLocation

-(instancetype)init {
    self = [self initWithName:@"" latitude:0.0 longitude:0.0];
    return self;
}

-(instancetype)initWithName:(NSString *)name
                   latitude:(CGFloat)latitude
                  longitude:(CGFloat)longitude {
    self = [super init];
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [NSMutableArray new]; //  [[NSMutableArray aloc]init]
    }
    return self;
}

-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    if ([self.name length] > length) {
        NSString *shortName = [self.name substringToIndex:length];
        return shortName;
    } else {
        return self.name;
    }
}

-(BOOL)hasValidData {
    BOOL isValid = YES;
    if ([self.name length] < 1) {
        isValid = NO;
    }
    if (self.latitude <= -90 || self.latitude >= 90) {
        isValid = NO;
    }
    if (self.longitude <= -180 || self.longitude >= 180) {
        isValid = NO;
    }
    return isValid;
}


-(FISTrivium *)triviumWithMostLikes {
    if (![self.trivia count]) {
        return nil;
    }
    NSSortDescriptor *ascendingOrder = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:YES];
    [self.trivia sortUsingDescriptors:@[ascendingOrder]];
    return [self.trivia lastObject];
}


@end
