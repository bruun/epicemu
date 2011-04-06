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

@interface GameViewController : UIViewController <UIGestureRecognizerDelegate> {
    Level *level;
    LevelView *levelView;
    
    IBOutlet PlayerView *playerView;
    Player *player;
    
    NSTimer *timer;
}

@property(nonatomic, retain) Level *level;
@property(nonatomic, retain) LevelView *levelView;

@property(nonatomic, retain) Player *player;
@property(nonatomic, retain) PlayerView *playerView;

- (void)tick:(NSTimer *)sender;
- (void)jump:(UIGestureRecognizer *)gesture;

@end
