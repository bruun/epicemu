//
//  MainMenuViewController.h
//  epicemu
//
//  Created by Håkon Erichsen on 4/6/11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

typedef enum {
    kViewStateFrontMenu,
    kViewStateLevelMenu
} ViewState;

@interface MainMenuViewController : UIViewController {
    RootViewController *root;
    ViewState *state;
    UIImageView *logo;
    UIButton *playButton;
    UILabel *playText;
}


- (IBAction)touchDown:(id)sender;
- (id) initWithRoot:(RootViewController *)root;

- (void) hideViews;
- (void) makeLevelButtons;

@property(retain,nonatomic) RootViewController *root;
@property(nonatomic) ViewState *state;
@property (nonatomic, retain) IBOutlet UIImageView *logo;
@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UILabel *playText;

@end
