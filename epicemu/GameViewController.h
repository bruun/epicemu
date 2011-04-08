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
#import "PauseMenuViewController.h"

#define FPS         25
#define SKIP_TICKS  1000 / FPS

@interface GameViewController : UIViewController <UIGestureRecognizerDelegate> {
    
    
    PauseMenuViewController *pauseMenu;
    Level *level;
    LevelView *levelView;
    
    IBOutlet PlayerView *playerView;
    Player *player;
    IBOutlet UILabel *scoreLabel;
    UILabel *unlockLabel;
    
    float nextTick;
    BOOL _running;
}



@property(retain,nonatomic) PauseMenuViewController *pauseMenu;
@property(nonatomic, retain) Level *level;
@property(nonatomic, retain) LevelView *levelView;

@property(nonatomic, retain) Player *player;
@property(nonatomic, retain) PlayerView *playerView;
@property(nonatomic, retain) IBOutlet UILabel *scoreLabel;
@property (nonatomic, retain) IBOutlet UILabel *unlockLabel;

- (id)initLevel:(int)levelNumber;
- (void)tick:(NSTimeInterval)timeInterval;
- (void)action:(UIGestureRecognizer *)gesture;

- (void)gameLoop;

@end
