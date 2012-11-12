//
//  AppDelegate.m
//  Wakeboard
//
//  Created by Chad Zeluff on 11/11/12.
//  Copyright (c) 2012 Chad Zeluff. All rights reserved.
//

#import "AppDelegate.h"

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

- (UINavigationController *)newNavigationControllerWrappingViewControllerForDataSourceOfClass:(Class)datasourceClass {
	// this is entirely a convenience method to reduce the repetition of the code
	// in the setupPortaitUserInterface
	// it returns a retained instance of the UINavigationController class. This is unusual, but
	// it is necessary to limit the autorelease use as much as possible.
	
	// for each tableview 'screen' we need to create a datasource instance (the class that is passed in)
	// we then need to create an instance of ElementsTableViewController with that datasource instance
	// finally we need to return a UINaviationController for each screen, with the ElementsTableViewController
	// as the root view controller.
	
	// many of these require the temporary creation of objects that need to be released after they are configured
	// and factoring this out makes the setup code much easier to follow, but you can still see the actual
	// implementation here
	
	
	// the class type for the datasource is not crucial, but that it implements the
	// ElementsDataSource protocol and the UITableViewDataSource Protocol is.
//	id<UITableViewDataSource> dataSource = [[datasourceClass alloc] init];
	
	// create the ElementsTableViewController and set the datasource
	UITableViewController *theViewController;
//	theViewController = [[UITableViewController alloc] initWithDataSource:dataSource];
	
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
	
	// setup the 4 view controllers for the different data representations
	
	// create the view controller and datasource for the ElementsSortedByNameDataSource
	// wrap it in a UINavigationController, and add that navigationController to the
	// viewControllersArray array
    
    //Chad, looks back at Elements.app to see how this used to look.
	localNavigationController = [self newNavigationControllerWrappingViewControllerForDataSourceOfClass:[UITableViewController class]];
	[localViewControllersArray addObject:localNavigationController];	
	
	// repeat the process for the ElementsSortedByAtomicNumberDataSource
	localNavigationController = [self newNavigationControllerWrappingViewControllerForDataSourceOfClass:[UITableViewController class]];
	[localViewControllersArray addObject:localNavigationController];
	
	
	// repeat the process for the ElementsSortedBySymbolDataSource
	localNavigationController = [self newNavigationControllerWrappingViewControllerForDataSourceOfClass:[UITableViewController class]];
	[localViewControllersArray addObject:localNavigationController];	
	
	// repeat the process for the ElementsSortedByStateDataSource
	localNavigationController = [self newNavigationControllerWrappingViewControllerForDataSourceOfClass:[UITableViewController class]];
	[localViewControllersArray addObject:localNavigationController];
    
    // repeat the process for the ElementsSortedByStateDataSource
	localNavigationController = [self newNavigationControllerWrappingViewControllerForDataSourceOfClass:[UITableViewController class]];
	[localViewControllersArray addObject:localNavigationController];
	
	// set the tab bar controller view controller array to the localViewControllersArray
	tabBarController.viewControllers = localViewControllersArray;
	
	// set the window subview as the tab bar controller
	[portraitWindow addSubview:tabBarController.view];
	
	// make the window visible
	[portraitWindow makeKeyAndVisible];
    
    
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
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
