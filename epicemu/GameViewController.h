//
//  GameViewController.h
//  epicemu
//
//  Created by Håkon Erichsen on 3/23/11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Level.h"
#import "Player.h"

#define FPS         25
#define SKIP_TICKS  1000 / FPS

@interface GameViewController : UIViewController <UIGestureRecognizerDelegate> {
    @private
    // Pause menu buttons
    IBOutlet UIButton *resumeButton;
    IBOutlet UIButton *retryButton;
    IBOutlet UIButton *mainMenuButton;
    
    IBOutlet UIView *pauseMenu;

    Level *level;
    LevelView *levelView;
    
    Player *player;
    IBOutlet PlayerView *playerView;
    IBOutlet UILabel *scoreLabel;
    
    UILabel *unlockLabel;
    
    float nextTick;
    BOOL _running;
    
}

@property(nonatomic, retain) IBOutlet UIView *pauseMenu;

@property(nonatomic, retain) Level *level;
@property(nonatomic, retain) LevelView *levelView;

@property(nonatomic, retain) Player *player;
@property(nonatomic, retain) PlayerView *playerView;

@property(nonatomic, retain) IBOutlet UILabel *scoreLabel;
@property(nonatomic, retain) IBOutlet UILabel *unlockLabel;

@property(nonatomic, retain) IBOutlet UIButton *resumeButton;
@property(nonatomic, retain) IBOutlet UIButton *retryButton;
@property(nonatomic, retain) IBOutlet UIButton *mainMenuButton;

- (id)initLevel:(int)levelNumber;
- (void)tick:(NSTimeInterval)timeInterval;
- (void)action:(UIGestureRecognizer *)gesture;
- (void)pauseGame:(UIGestureRecognizer *)gesture;
- (void)hideMenuButtons;

- (IBAction)resumeGame:(id)sender;
- (IBAction)retryLevel:(id)sender;
- (IBAction)gotoMainMenu:(id)sender;- (void)gameLoop;

@end
