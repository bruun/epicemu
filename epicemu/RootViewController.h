//
//  epicemuViewController.h
//  epicemu
//
//  Created by Thomas Bruun on 3/23/11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {
    UIViewController *currentController;
}

@property(nonatomic, retain) UIViewController *currentController;

- (void) switchToGameViewWithLevel:(int)level;
- (void) switchToPauseMenuViewWithLevel:(int)level;

@end
