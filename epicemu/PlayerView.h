//
//  Player.h
//  epicemu
//
//  Created by Jonas Myrlund on 30.03.11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>

#define P_NORMAL    1
#define P_ATTACKING 2

@interface PlayerView : UIView {
@private
    int _state;
}

@property(nonatomic) int state;

@end
