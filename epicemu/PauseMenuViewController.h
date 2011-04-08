//
//  PauseMenuViewController.h
//  epicemu
//
//  Created by Thomas Bruun on 4/7/11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Level.h"
#import "RootViewController.h"

@interface PauseMenuViewController : UIViewController <UIGestureRecognizerDelegate> {
@private
    RootViewController *root;
    IBOutlet UIButton *resumeButton;
    IBOutlet UIButton *retryButton;
    IBOutlet UIButton *mainMenuButton;
    Level *level;
    
}
- (IBAction)resumeGame:(id)sender;
- (IBAction)retryLevel:(id)sender;
- (IBAction)gotoMainMenu:(id)sender;

@property(retain,nonatomic) RootViewController *root;
@property (nonatomic, retain) IBOutlet UIButton *resumeButton;
@property (nonatomic, retain) IBOutlet UIButton *retryButton;
@property (nonatomic, retain) IBOutlet UIButton *mainMenuButton;

@end
