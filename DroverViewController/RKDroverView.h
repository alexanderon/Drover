//
//  RKDroverView.h
//  crunch
//
//  Created by Rajesh Vishwakarma on 3/21/15.
//  Copyright (c) 2015 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RKDroverViewDelegate <NSObject>

-(void) willHideOtherDrover:(BOOL) isHide;
-(void) didLeftDroverDragingBegin;
-(void) didLeftDroverDragingEnd;
@end

@interface RKDroverView : UIView

@property(weak,nonatomic) id<RKDroverViewDelegate> delegate;

-(id) initWithTarget:(id<RKDroverViewDelegate>) target frame:(CGRect) frame;

-(void) updateCrunchInDetails:(NSDictionary*) crunchInDict;

@end
