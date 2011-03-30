//
//  LevelView.h
//  epicemu
//
//  Created by Jonas Myrlund on 30.03.11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LevelView : UIView {
@private
    NSMutableArray *controlPoints;
}

- (void)drawWithPoints:(NSMutableArray *)newPoints;

@end
