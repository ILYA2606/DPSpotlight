//
//  DPSpotlight.h
//  SpotlightTest
//
//  Created by ILYA2606 on 29.10.15.
//  Copyright © 2015 AlfaBank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreSpotlight/CoreSpotlight.h>

@class DPSpotlightItem;

typedef void(^DPSpotlightActivity)(NSUserActivity * __nonnull userActivity);


@interface DPSpotlight : NSObject

/*!
 * Block for handling user activity
 */

@property (nonnull, nonatomic, copy) DPSpotlightActivity activityBlock;

/**
 Singleton
 
 @author Ilya Shkolnik
 @return DPSpotlight object
 */

+(nonnull instancetype)sharedInstance;

/**
 Handling user activity on start application. Call this method on @b application:didFinishLaunchingWithOptions:
 
 @author Ilya Shkolnik
 @param launchOptions 
        Launch options of application
 @param launchBlock 
        Block for launch userActivity
 */

+(void)startWithLaunchOptions:(nullable NSDictionary *)launchOptions launchBlock:(nullable DPSpotlightActivity)launchBlock;

/**
 Handling user activity. Call this method on @b application:continueUserActivity:restorationHandler:
 
 @author Ilya Shkolnik
 @param userActivity 
        Handled NSUserActivity
 */

+(void)continueUserActivity:(nonnull NSUserActivity *)userActivity;

/**
 Indexing of items array.
 
 @author Ilya Shkolnik
 @param items
        Array of DPSpotlightItem
 */

+(void)indexItems:(nonnull NSArray<DPSpotlightItem*>*)items;

@end


@interface DPSpotlightItem : CSSearchableItem

/**
 Create DPSpotlightItem from CSSearchableItemAttributeSet and ID
 
 @author Ilya Shkolnik
 @param attributeSet
        A set of properties that specify the metadata you want to display about an item in a search result. See CSSearchableItemAttributeSet for the types of properties you can use.
 @param uniqueIdentifier 
        If you specify NULL, an identifier is generated automatically.
 */

+(nonnull instancetype)itemWithAttributeSet:(nonnull CSSearchableItemAttributeSet *)attributeSet uniqueIdentifier:(nullable NSString *)uniqueIdentifier;

@end


@interface CSSearchableItemAttributeSet (DPSpotlight)

/*!
 * Image for searchable item
 */

@property (nonatomic, nullable, copy) UIImage *image;

@end
