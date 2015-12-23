//
//  DroverViewController.h
//  DroverViewController
//
//  Created by RAHUL on 12/21/15.
//  Copyright © 2015 RAHUL. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RKDroverViewDelegate <NSObject>

//-(void) willHideOtherDrover:(BOOL) isHide;
-(void) didLeftDroverDragingBegin;
-(void) didLeftDroverDragingEnd;
@end


@interface DroverViewController : UIViewController

@property(weak,nonatomic) id<RKDroverViewDelegate> delegate;

@end
