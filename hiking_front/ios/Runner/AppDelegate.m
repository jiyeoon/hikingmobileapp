#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

// Add the following import.
#import "GoogleMaps/GoogleMaps.h"
//#import Firebase;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];

  //[FIRApp configure];

  // Add the following line, with your API key
  [GMSServices provideAPIKey: @"AIzaSyDqM78Plt99H1ErpNH9hxBtuZRxOBvoo5g"];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];

}

@end
