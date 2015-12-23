//
//  DroverRightDelegate.h
//  DroverViewController
//
//  Created by RAHUL on 12/23/15.
//  Copyright © 2015 RAHUL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DroverRightDelegate <NSObject>

-(void) didRightDroverDragingBegin;
-(void) didRightDroverDragingEnd;
@end
