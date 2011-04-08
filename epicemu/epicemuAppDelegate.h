//
//  epicemuAppDelegate.h
//  epicemu
//
//  Created by Thomas Bruun on 3/23/11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GameViewController.h"
#import "RootViewController.h"
#import "MenuViewController.h"

@class RootViewController, GameViewController, MenuViewController;

@interface epicemuAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UIViewController *viewController;

@end
