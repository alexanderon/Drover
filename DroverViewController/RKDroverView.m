//
//  RKDroverView.m
//  crunch
//
//  Created by Rajesh Vishwakarma on 3/21/15.
//  Copyright (c) 2015 Rajesh. All rights reserved.
//

#import "RKDroverView.h"
#import "Utility.h"
#import "RKAppDelegate.h"

@interface RKDroverView ()
{
    UIView *leftSideMainViewContainer;
    UIView *leftMenuView;
    BOOL isLeftDroverOpened;
    
    UIImageView *drowerImageView;
    UILabel *totalKaclLabel;
    UILabel *previousKaclLabel;
    UILabel *maxKaclLabel;
    UILabel *minKaclLabel;
    
    RKAppDelegate *appDelegate;
}

@property (nonatomic,strong) NSMutableDictionary *crunchInInfo;

@end

@implementation RKDroverView

-(id) initWithTarget:(id<RKDroverViewDelegate>)target frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        //self.backgroundColor = [UIColor greenColor];
        
        appDelegate = (RKAppDelegate* )[[UIApplication sharedApplication] delegate];
        
        self.delegate = target;
        _crunchInInfo = [[NSMutableDictionary alloc] init];
        
        [self initializeViewWithComponents];
        
    }
    
    return self;
}


-(void) updateCrunchInDetails:(NSDictionary *)crunchInDict
{
    
    [_crunchInInfo removeAllObjects];
    
    [_crunchInInfo addEntriesFromDictionary:crunchInDict];
    
    int total = (int)ceilf([[_crunchInInfo valueForKey:@"Total"] floatValue]);
    int last = (int)ceilf([[_crunchInInfo valueForKey:@"Last"] floatValue]);
    int max = (int)ceilf([[_crunchInInfo valueForKey:@"Max"] floatValue]);
    int min = (int)ceilf([[_crunchInInfo valueForKey:@"Min"] floatValue]);
    
    totalKaclLabel.text = [[@(total) stringValue] stringByAppendingString:@" kcal"];
    previousKaclLabel.text = [[@(last) stringValue]stringByAppendingString:@" kcal"];
    maxKaclLabel.text = [[@(max) stringValue] stringByAppendingString:@" kcal"];
    minKaclLabel.text = [[@(min) stringValue] stringByAppendingString:@" kcal"];
    
}

-(void) initializeViewWithComponents
{
    
    //containerView
    leftSideMainViewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    leftSideMainViewContainer.backgroundColor = kCrunchColor1;
    [self addSubview:leftSideMainViewContainer];
    
    
    UILabel *launchCameraLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 330, 260, 21)];
    launchCameraLabel.text = @"launch camera beyond this point";
    launchCameraLabel.textAlignment = NSTextAlignmentCenter;
    launchCameraLabel.textColor = [UIColor whiteColor];
    [leftSideMainViewContainer addSubview:launchCameraLabel];
    launchCameraLabel.transform = CGAffineTransformMakeRotation(-90 * M_PI / 180.0);
    
    UIView *lineLayer = [[UIView alloc] initWithFrame:CGRectMake(75+15, 340, 250,1)];
    lineLayer.backgroundColor = [UIColor whiteColor];
    [leftSideMainViewContainer addSubview:lineLayer];
    lineLayer.transform = CGAffineTransformMakeRotation(-90 * M_PI / 180.0);
    
    //Left Side Drover
    leftMenuView = [self createLeftSideDroverComponents];
    [self addSubview:leftMenuView];
   
}


//*******add Camera View *******************
-(void)addCameraView
{
    [appDelegate showCrunchDroverWithType:kLeftDrover];
}

-(void) createCrunchInDetailsView:(UIView*) containerView
{

    
    //IN
    
    UILabel *inLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5+200, 75, 30)];
    inLabel.text = @"IN";
    inLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:22.0];
    inLabel.textAlignment = NSTextAlignmentCenter;
    inLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:inLabel];
    
    //TOTAL
    
    UILabel *totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 55+200, 75, 21)];
    totalLabel.text = @"TOTAL";
    totalLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    totalLabel.textAlignment = NSTextAlignmentCenter;
    totalLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:totalLabel];
    
    totalKaclLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 66+200, 75, 21)];
    //totalKaclLabel.text = @"500 Kcal";
    totalKaclLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    totalKaclLabel.textAlignment = NSTextAlignmentCenter;
    totalKaclLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:totalKaclLabel];
    
    
    //PREVIOUS
    
    UILabel *previousLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100+200, 75, 21)];
    previousLabel.text = @"PREVIOUS";
    previousLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    previousLabel.textAlignment = NSTextAlignmentCenter;
    previousLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:previousLabel];
    
    previousKaclLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 111+200, 75, 21)];
    previousKaclLabel.text = @"20 cal";
    previousKaclLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    previousKaclLabel.textAlignment = NSTextAlignmentCenter;
    previousKaclLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:previousKaclLabel];

    
    //MAX
    UILabel *maxLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 145+200, 75, 21)];
    maxLabel.text = @"MAX";
    maxLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    maxLabel.textAlignment = NSTextAlignmentCenter;
    maxLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:maxLabel];
    
    
    maxKaclLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 156+200, 75, 21)];
    maxKaclLabel.text = @"207 cal";
    maxKaclLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    maxKaclLabel.textAlignment = NSTextAlignmentCenter;
    maxKaclLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:maxKaclLabel];
    

    
    //MIN
    UILabel *minLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 188+200, 75, 21)];
    minLabel.text = @"MIN";
    minLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    minLabel.textAlignment = NSTextAlignmentCenter;
    minLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:minLabel];
    
    
    minKaclLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 199+200, 75, 21)];
    minKaclLabel.text = @"18 cal";
    minKaclLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    minKaclLabel.textAlignment = NSTextAlignmentCenter;
    minKaclLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:minKaclLabel];

    
    //MIN
    UILabel *slideOutLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 240+200, 75, 21)];
    slideOutLabel.text = @"Slide out to";
    slideOutLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    slideOutLabel.textAlignment = NSTextAlignmentCenter;
    slideOutLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:slideOutLabel];
    
    
    UILabel *crunchInLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 252+200, 75, 21)];
    crunchInLabel.text = @"CRUNCH IN";
    crunchInLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    crunchInLabel.textAlignment = NSTextAlignmentCenter;
    crunchInLabel.textColor = [UIColor whiteColor];
    [containerView addSubview:crunchInLabel];
    
}


-(UIView*) createLeftSideDroverComponents
{
    UIView *leftSideContainerView = [[UIView alloc] initWithFrame:CGRectMake(320, 0, 95, 568)];
    leftSideContainerView.backgroundColor = [UIColor clearColor];
    
    UIView *crunchInView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 568)];
    crunchInView.backgroundColor = kCrunchColor1;
    [leftSideContainerView addSubview:crunchInView];
    
    
    [self createCrunchInDetailsView:crunchInView];
    
    
    drowerImageView = [[UIImageView alloc]init];
    drowerImageView.frame = CGRectMake(75, 430, 20, 60);
    [drowerImageView setImage:[UIImage imageNamed:@"crunch_in_button.png"]];
    [leftSideContainerView addSubview:drowerImageView];
    drowerImageView.userInteractionEnabled = YES;
    
    
    UIPanGestureRecognizer *panGestureReognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragnigViewGestureReognizerAction:)];
    [drowerImageView addGestureRecognizer:panGestureReognizer];
    
    isLeftDroverOpened = NO;
    
    
    return leftSideContainerView;
}

-(void)dragnigViewGestureReognizerAction:(UIGestureRecognizer*)gesture
{
    
    CGPoint frame = [gesture locationInView:self];
    
    float locationDifferent = frame.x - self.frame.size.width;
    
    switch (gesture.state)
    {
        case UIGestureRecognizerStateBegan:
        {
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
           // NSLog(@"diff == %f",locationDifferent);
            
            CGRect rect = self.frame;
            rect.origin.x = rect.origin.x +  locationDifferent;
            self.frame = rect;
            
            [_delegate didLeftDroverDragingBegin];
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            if(!(self.frame .origin.x <= -self.frame.size.width/2)){
                [self showCameraMenuDrover:nil];
            }
            else
            {
                [self leftDroverWillClose:nil];
            }
            
            break;
        }
        
        case UIGestureRecognizerStateCancelled: break;
        case UIGestureRecognizerStateFailed: break;
        case UIGestureRecognizerStatePossible: break;
    }

}


-(void) showCameraMenuDrover:(id) sender
{
    
    //NSLog(@"Left Drover Opened");
    
    
    for (UIView *v in leftSideMainViewContainer.subviews)
    {
        [UIView animateWithDuration:0.25 animations:^
        {
            v.alpha = 0;
        }
         completion:^(BOOL finished)
        {
             if (finished)
             {
                 [v removeFromSuperview];
             }
        }];
    }
    
    [_delegate willHideOtherDrover:YES];
    
    // Hide Other Drover Button
    
    CGRect rect = self.frame;
    
    rect.origin.x = 0;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = rect;
    }
     completion:^(BOOL finished) {
         
         [self performSelector:@selector(addCameraView) withObject:nil afterDelay:0.1];
     }];
}


-(void)leftDroverWillClose:(id)sender
{
    [_delegate willHideOtherDrover:NO];

    
    CGRect rect = self.frame;
    rect.origin.x = -395;
    [UIView animateWithDuration:.75 animations:^{
        
        isLeftDroverOpened  = NO;
        drowerImageView.userInteractionEnabled = YES;
        
        self.frame = rect;
    }
     completion:^(BOOL finished) {
         if (finished) {
             [_delegate didLeftDroverDragingEnd];
         }
     }
     ];
}


-(void) showLeftMenuDrover:(id) sender
{
    
    CGRect rect = self.frame;

    if (isLeftDroverOpened) {
    
        isLeftDroverOpened  = NO;
        rect.origin.x = -395;
    }
    else
    {
        isLeftDroverOpened = YES;
                
        rect.origin.x = -320;
    }

    [UIView animateWithDuration:0.35 animations:^{
        
        self.frame = rect;

    } completion:^(BOOL finished)
     
     {
         drowerImageView.userInteractionEnabled = NO;
        
         [self performSelector:@selector(leftDroverWillClose:) withObject:nil afterDelay:.35];
         
     }];
    
}



@end
