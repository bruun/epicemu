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
#import "RootViewController.h"

#define FPS         25
#define SKIP_TICKS  1000 / FPS

@interface GameViewController : UIViewController <UIGestureRecognizerDelegate> {
    
    RootViewController *root;
    Level *level;
    LevelView *levelView;
    
    IBOutlet PlayerView *playerView;
    Player *player;
    
    float nextTick;
    BOOL _running;
}

@property(retain,nonatomic) RootViewController *root;
@property(nonatomic, retain) Level *level;
@property(nonatomic, retain) LevelView *levelView;

@property(nonatomic, retain) Player *player;
@property(nonatomic, retain) PlayerView *playerView;

- (void)tick:(NSTimeInterval)timeInterval;
- (void)action:(UIGestureRecognizer *)gesture;

- (void)gameLoop;

@end
