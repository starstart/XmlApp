//
//  XmlAppTestAppDelegate.m
//  XmlAppTest
//
//  Created by  on 2011/10/14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "XmlAppTestAppDelegate.h"
#import "XmlAppTestViewController.h"
#import "XMLParser.h"
#import "hotel.h"
#import "mainTableViewController.h"

@implementation XmlAppTestAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize hotels;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Override point for customization after application launch.


	NSURL *url = [[NSURL alloc] initWithString:@"http://www.taipei.gov.tw/public/ogdi/blob/hotel.xml"];
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	
	//Initialize the delegate.
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	
	//Set delegate
	[xmlParser setDelegate:parser];
	
	//Start parsing the XML file.
	BOOL success = [xmlParser parse];
	
	if(success)
		NSLog(@"No Errors");
	else
		NSLog(@"Error Error Error!!!");
    
    UIViewController *myVC = [[mainTableViewController alloc] initWithNibName:@"mainTableViewController"bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:myVC];
    self.window.rootViewController = navController;
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

- (void)dealloc
{
	[_window release];
	[_viewController release];
    [super dealloc];
}

@end
