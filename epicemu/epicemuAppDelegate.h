//
//  epicemuAppDelegate.h
//  epicemu
//
//  Created by Thomas Bruun on 3/23/11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface epicemuAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet RootViewController *viewController;

@end
