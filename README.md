# DPSpotlight
Easy integration on iOS 9 Spotlight. Indexing and handling user activity.

![DPSpotlight](http://ilya2606.ru/wp-content/uploads/2015/10/Копия-IMG_0037.png "DPSpotlight")

# How to USE
1) Call initiate DPSpotlight method 
```<Objective-C>
[DPSpotlight startWithLaunchOptions:launchOptions launchBlock:^(NSUserActivity * _Nonnull userActivity) {
  //do something
}]; 
```
on method 
```<Objective-C>
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
```

2) Call provide DPSpotlight method
```<Objective-C>
[DPSpotlight continueUserActivity:userActivity];
```
on method 
```<Objective-C>
- (BOOL)application:(nonnull UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray * __nullable))restorationHandler
```

3) Handle user activity
[DPSpotlight sharedInstance].activityBlock = ^(NSUserActivity * __nonnull userActivity){

};
