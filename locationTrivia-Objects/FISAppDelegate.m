//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISLocation.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *)allLocationNames {
    NSMutableArray *allLocations = [[NSMutableArray alloc] init];
    for (FISLocation *eachLocation in self.locations) {
        [allLocations addObject:eachLocation.name];
    }
    return allLocations;
}

-(FISLocation *)locationNamed:(NSString *)name {
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@",name];
    NSArray *arrayOfMatchingSubmitedNames = [self.locations filteredArrayUsingPredicate:namePredicate];
    if ([arrayOfMatchingSubmitedNames count]) {
        FISLocation *locationAndName = arrayOfMatchingSubmitedNames[0];
        return locationAndName;
    } else {
        return nil;
    }
    return nil;
}

-(NSArray *)locationsNearLatitude:(CGFloat)latitude
                        longitude:(CGFloat)longitude
                           margin:(CGFloat)margin {
    NSMutableArray *locationsInMargin = [NSMutableArray new]; // same as: [[NSMutableArray alloc]init]
    for (FISLocation *eachLocation in self.locations) {
        if (fabs(eachLocation.latitude - latitude) <= margin || fabs(eachLocation.latitude + latitude) <=margin) {
            [locationsInMargin addObject:eachLocation];
        }
    }
    return locationsInMargin;
}


@end
