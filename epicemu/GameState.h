//
//  GameState.h
//  epicemu
//
//  Created by Thomas Bruun on 3/23/11.
//  Copyright 2011 Private. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GameState : NSObject {
    @private
    IBOutlet NSInteger* score;
    IBOutlet NSInteger* level;
    IBOutlet enum state{ MENU, GAME, SHOP } NSInteger;
    
}

@property(nonatomic) IBOutlet NSInteger* score;
@property(nonatomic) IBOutlet NSInteger* level;
@property(nonatomic) IBOutlet NSInteger* state;

@end
