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

    ViewState *state;
    UIImageView *logo;
    UIButton *playButton;
    UILabel *playText;
}


- (IBAction) loadLevel:(id)sender;
- (IBAction)touchDown:(id)sender;

- (void) hideViews;
- (void) makeLevelButtons;


@property(nonatomic) ViewState *state;
@property (nonatomic, retain) IBOutlet UIImageView *logo;
@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UILabel *playText;

@end
