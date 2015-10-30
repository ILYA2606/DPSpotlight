//
//  ViewController.m
//  SpotlightTest
//
//  Created by ILYA2606 on 23.10.15.
//  Copyright © 2015 AlfaBank. All rights reserved.
//

#import "ViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import "DPSpotlight.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //indexing
    [self indexLogic];
    
    //handling user activity
    [DPSpotlight sharedInstance].activityBlock = ^(NSUserActivity * __nonnull userActivity){
        _titleLabel.text = [NSString stringWithFormat:@"You open item with title: %@", userActivity.title];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)indexLogic{
    //config item1
    CSSearchableItemAttributeSet *set1 = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"view"];
    set1.title = @"ILYA2606";
    set1.contentDescription = @"View ILYA2606";
    set1.image = [UIImage imageNamed:@"dp_logo"];
    set1.keywords = @[@"ios", @"developer"];
    DPSpotlightItem *item1 = [DPSpotlightItem itemWithAttributeSet:set1 uniqueIdentifier:@"ILYA2606"];
    
    //config item2
    CSSearchableItemAttributeSet *set2 = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"view"];
    set2.title = @"Darkness Production";
    set2.contentDescription = @"View Darkness Production";
    set2.image = [UIImage imageNamed:@"dp_logo"];
    set2.keywords = @[@"darkness", @"production", @"game"];
    DPSpotlightItem *item2 = [DPSpotlightItem itemWithAttributeSet:set2 uniqueIdentifier:@"Darkness Production"];
    
    //indexing items
    [DPSpotlight indexItems:@[item1, item2]];
}

@end
