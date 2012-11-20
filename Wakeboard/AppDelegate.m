//
//  AppDelegate.m
//  Wakeboard
//
//  Created by Chad Zeluff on 11/11/12.
//  Copyright (c) 2012 Chad Zeluff. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface AppDelegate() <UIApplicationDelegate> //, UITabBarControllerDelegate>
{
    UIWindow *portraitWindow;
    UITabBarController *tabBarController;
}

@end

@implementation AppDelegate

- init
{
	if (self = [super init])
    {
		// initialize  to nil
		portraitWindow = nil;
		tabBarController = nil;
	}
	return self;
}

- (UINavigationController *)newNavigationControllerWrappingViewController:(Class)viewControllerClass
{
	UIViewController *theViewController = [[viewControllerClass alloc] init];
	
	// create the navigation controller with the view controller
	UINavigationController *theNavigationController;
	theNavigationController = [[UINavigationController alloc] initWithRootViewController:theViewController];
	
	return theNavigationController;
}


- (void)setupPortraitUserInterface
{
	// a local navigation variable
	// this is reused several times
	UINavigationController *localNavigationController;
    
    // Set up the portraitWindow and content view
	UIWindow *localPortraitWindow;
	localPortraitWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    portraitWindow = localPortraitWindow;    
	
    [portraitWindow setBackgroundColor:[UIColor blackColor]];
    
	// Create a tabbar controller and an array to contain the view controllers
	tabBarController = [[UITabBarController alloc] init];
	NSMutableArray *localViewControllersArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    //Chad, looks back at Elements.app to see how this used to look.
	localNavigationController = [self newNavigationControllerWrappingViewController:[FirstViewController class]];
	[localViewControllersArray addObject:localNavigationController];	
	
	// repeat the process for the ElementsSortedByAtomicNumberDataSource
	localNavigationController = [self newNavigationControllerWrappingViewController:[SecondViewController class]];
	[localViewControllersArray addObject:localNavigationController];
	
	
	// repeat the process for the ElementsSortedBySymbolDataSource
	localNavigationController = [self newNavigationControllerWrappingViewController:[ThirdViewController class]];
	[localViewControllersArray addObject:localNavigationController];	
	
	// repeat the process for the ElementsSortedByStateDataSource
	localNavigationController = [self newNavigationControllerWrappingViewController:[FourthViewController class]];
	[localViewControllersArray addObject:localNavigationController];
    
    // repeat the process for the ElementsSortedByStateDataSource
	localNavigationController = [self newNavigationControllerWrappingViewController:[FifthViewController class]];
	[localViewControllersArray addObject:localNavigationController];
	
	// set the tab bar controller view controller array to the localViewControllersArray
	tabBarController.viewControllers = localViewControllersArray;
    portraitWindow.rootViewController = tabBarController;
	
	// set the window subview as the tab bar controller
	[portraitWindow addSubview:tabBarController.view];
	
	// make the window visible
	[portraitWindow makeKeyAndVisible];
    
    
}

- (void)applyStylesheet
{
    // Tab bar
    UITabBar *tabBar = [UITabBar appearance];
    [tabBar setBackgroundImage:[UIImage imageWithColor:[UIColor dblUpOrangeColor]]];
    [tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"tabSelected"]];    
    
	// Navigation bar
	UINavigationBar *navigationBar = [UINavigationBar appearance];
	[navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
	[navigationBar setTitleVerticalPositionAdjustment:-1.0f forBarMetrics:UIBarMetricsDefault];
	[navigationBar setTitleTextAttributes:[[NSDictionary alloc] initWithObjectsAndKeys:
										   [UIFont boldFontOfSize:18.0f], UITextAttributeFont,
										   [UIColor clearColor], UITextAttributeTextShadowColor,
										   [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)], UITextAttributeTextShadowOffset,
										   [UIColor dblUpBlackColor], UITextAttributeTextColor,
										   nil]];
    
    /*
	
	// Navigation bar mini
	[navigationBar setTitleVerticalPositionAdjustment:-2.0f forBarMetrics:UIBarMetricsLandscapePhone];
	[navigationBar setBackgroundImage:[UIImage imageNamed:@"nav-background-mini"] forBarMetrics:UIBarMetricsLandscapePhone];
	
	// Navigation button
	NSDictionary *barButtonTitleTextAttributes = [[NSDictionary alloc] initWithObjectsAndKeys:
												  [UIFont cheddarInterfaceFontOfSize:14.0f], UITextAttributeFont,
												  [UIColor colorWithWhite:0.0f alpha:0.2f], UITextAttributeTextShadowColor,
												  [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 1.0f)], UITextAttributeTextShadowOffset,
												  nil];
	UIBarButtonItem *barButton = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
	//	[barButton setTitlePositionAdjustment:UIOffsetMake(0.0f, 1.0f) forBarMetrics:UIBarMetricsDefault];
	[barButton setTitleTextAttributes:barButtonTitleTextAttributes forState:UIControlStateNormal];
	[barButton setTitleTextAttributes:barButtonTitleTextAttributes forState:UIControlStateHighlighted];
	[barButton setBackgroundImage:[[UIImage imageNamed:@"nav-button"] stretchableImageWithLeftCapWidth:6 topCapHeight:0] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	[barButton setBackgroundImage:[[UIImage imageNamed:@"nav-button-highlighted"] stretchableImageWithLeftCapWidth:6 topCapHeight:0] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
	
	// Navigation back button
	[barButton setBackButtonTitlePositionAdjustment:UIOffsetMake(2.0f, -2.0f) forBarMetrics:UIBarMetricsDefault];
	[barButton setBackButtonBackgroundImage:[[UIImage imageNamed:@"nav-back"] stretchableImageWithLeftCapWidth:13 topCapHeight:0] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	[barButton setBackButtonBackgroundImage:[[UIImage imageNamed:@"nav-back-highlighted"] stretchableImageWithLeftCapWidth:13 topCapHeight:0] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
	
	// Navigation button mini
	//	[barButton setTitlePositionAdjustment:UIOffsetMake(0.0f, 1.0f) forBarMetrics:UIBarMetricsLandscapePhone];
	[barButton setBackgroundImage:[[UIImage imageNamed:@"nav-button-mini"] stretchableImageWithLeftCapWidth:6 topCapHeight:0] forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
	[barButton setBackgroundImage:[[UIImage imageNamed:@"nav-button-mini-highlighted"] stretchableImageWithLeftCapWidth:6 topCapHeight:0] forState:UIControlStateHighlighted barMetrics:UIBarMetricsLandscapePhone];
	
	// Navigation back button mini
	[barButton setBackButtonTitlePositionAdjustment:UIOffsetMake(2.0f, -2.0f) forBarMetrics:UIBarMetricsLandscapePhone];
	[barButton setBackButtonBackgroundImage:[[UIImage imageNamed:@"nav-back-mini"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
	[barButton setBackButtonBackgroundImage:[[UIImage imageNamed:@"nav-back-mini-highlighted"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateHighlighted barMetrics:UIBarMetricsLandscapePhone];
	
	// Toolbar
	UIToolbar *toolbar = [UIToolbar appearance];
	[toolbar setBackgroundImage:[UIImage imageNamed:@"navigation-background"] forToolbarPosition:UIToolbarPositionTop barMetrics:UIBarMetricsDefault];
	[toolbar setBackgroundImage:[UIImage imageNamed:@"toolbar-background"] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
	
	// Toolbar mini
	[toolbar setBackgroundImage:[UIImage imageNamed:@"navigation-background-mini"] forToolbarPosition:UIToolbarPositionTop barMetrics:UIBarMetricsLandscapePhone];
	[toolbar setBackgroundImage:[UIImage imageNamed:@"toolbar-background-mini"] forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsLandscapePhone];
     */
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    [self applyStylesheet];
	// configure the portrait user interface
	[self setupPortraitUserInterface];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
