//
//  DPSpotlight.m
//  SpotlightTest
//
//  Created by ILYA2606 on 29.10.15.
//  Copyright © 2015 AlfaBank. All rights reserved.
//

#import "DPSpotlight.h"
#import <objc/runtime.h>

@implementation DPSpotlight

static DPSpotlight *sharedInstance = NULL;

+(nonnull instancetype)sharedInstance{
    if (!sharedInstance || sharedInstance == NULL) {
		sharedInstance = [DPSpotlight new];
	}
	return sharedInstance;
}

+(void)startWithLaunchOptions:(nullable NSDictionary*)launchOptions launchBlock:(nullable DPSpotlightActivity)launchBlock{
    NSUserActivity *userActivity = [launchOptions objectForKey:UIApplicationLaunchOptionsUserActivityDictionaryKey][@"UIApplicationLaunchOptionsUserActivityKey"];
    NSLog(@"startWithLaunchOptions userActivity = %@", userActivity);
    if(userActivity){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if(launchBlock){
                launchBlock(userActivity);
            }
        });
    }
}

+(void)continueUserActivity:(nonnull NSUserActivity *)userActivity{
    if([DPSpotlight sharedInstance].activityBlock){
        [DPSpotlight sharedInstance].activityBlock(userActivity);
    }
}

+(void)indexItems:(NSArray<DPSpotlightItem*>*)items{
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:items completionHandler:^(NSError * __nullable error) {
        if(error)
            NSLog(@"%@",error.localizedDescription);
    }];
}

@end

@implementation DPSpotlightItem

+(instancetype)itemWithAttributeSet:(nonnull CSSearchableItemAttributeSet*)attributeSet uniqueIdentifier:(nullable NSString *)uniqueIdentifier{
    NSString *bundleIdentifier = [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"];
    return [[DPSpotlightItem alloc] initWithUniqueIdentifier:uniqueIdentifier domainIdentifier:bundleIdentifier attributeSet:attributeSet];
}

@end

@implementation CSSearchableItemAttributeSet (DPSpotlight)

#pragma mark - Getters

- (UIImage*)image{
    UIImage *object = objc_getAssociatedObject(self, "image");
    return object;
}

#pragma mark - Setters

- (void) setImage:(UIImage *)property{
    objc_setAssociatedObject(self, "image", property , OBJC_ASSOCIATION_RETAIN);
    self.thumbnailData = UIImagePNGRepresentation(property);
}

@end
