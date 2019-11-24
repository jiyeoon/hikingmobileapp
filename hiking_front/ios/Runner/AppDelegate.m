#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@import Firebase;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  [FIRApp configure];

  // Override point for customization after application launch.
  //return [super application:application didFinishLaunchingWithOptions:launchOptions];
  return YES;
}

@end
