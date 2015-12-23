//
//  ViewController.m
//  DroverViewController
//
//  Created by RAHUL on 12/21/15.
//  Copyright © 2015 RAHUL. All rights reserved.
//

#import "ViewController.h"
#import "DroverViewController.h"
#import "DroverRightViewController.h"
#import "DroverRightDelegate.h"

@interface ViewController ()<UIScrollViewDelegate,RKDroverViewDelegate,DroverRightDelegate>
{
    DroverViewController *drover;
    DroverRightViewController *droverRight;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    drover =[self.storyboard instantiateViewControllerWithIdentifier:@"DroverViewController"];
    [self addChildViewController:drover];
    [drover setDelegate:self];
    
    droverRight =[self.storyboard instantiateViewControllerWithIdentifier:@"DroverRightViewController"];
    [self addChildViewController:droverRight];
    [droverRight setDelegate:self];
}

-(void)viewDidAppear:(BOOL)animated
{
    if (drover) {
        CGRect frame  =[self.view frame];
        frame.origin.x -=frame.size.width;
        frame.size.width +=40;
        
        [drover.view setFrame:frame];
        [self.view addSubview:drover.view];
    }
    
    if (droverRight) {
        CGRect frame  =[self.view frame];
        frame.origin.x =frame.size.width-40;
        frame.size.width +=40;
        
        [droverRight.view setFrame:frame];
        [self.view addSubview:droverRight.view];
    }
    
    
}

#pragma mark RK Drawer Delegate

-(void)didLeftDroverDragingBegin
{
    [self.view bringSubviewToFront:drover.view];
}

-(void)didLeftDroverDragingEnd
{
    
}

-(void)didRightDroverDragingBegin
{
    [self.view bringSubviewToFront:droverRight.view];
}

-(void)didRightDroverDragingEnd
{
    
}
@end
