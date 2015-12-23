//
//  DroverRightViewController.m
//  DroverViewController
//
//  Created by RAHUL on 12/23/15.
//  Copyright © 2015 RAHUL. All rights reserved.
//

#import "DroverRightViewController.h"


@implementation DroverRightViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self addGestureForDragging];
    
}

-(void)addGestureForDragging
{
    UIPanGestureRecognizer *panGestureReognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragnigViewGestureReognizerAction:)];
    [self.imgDragging setUserInteractionEnabled:YES];
    [self.imgDragging addGestureRecognizer:panGestureReognizer];
}

-(void)dragnigViewGestureReognizerAction:(UIGestureRecognizer*)gesture
{
    CGPoint frame = [gesture locationInView:self.view];
    
       //    NSLog(@"%f",frame.x);
    
    float locationDifferent =  self.view.frame.size.width + frame.x ;
    
    
    NSLog(@"%f",locationDifferent);
    //   NSLog(@"%f",self.view.frame.size.width);
    switch (gesture.state)
    {
        case UIGestureRecognizerStateBegan:
        {
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGRect rect = self.view.frame;
            rect.origin.x = rect.origin.x -(self.view.frame.size.width-locationDifferent) ;
            self.view.frame = rect;
            
            [_delegate didRightDroverDragingBegin];
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            if(!(self.view.frame.origin.x >= self.view.frame.size.width/2))
            {
                 [self showCameraMenuDrover:nil];
            }
            else
            {
                [self rightDroverWillClose:nil];

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
    
    CGRect frame =[self.view frame];
    frame.origin.x=-40;
    
    [UIView animateWithDuration:0.75 animations:^{
        [self.view setFrame:frame];
        
        
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame =[self.view frame];
            frame.size.width-=40;
            frame.origin.x =40;
            [self.viewCrunchOut setFrame: frame];
            [self.view addSubview:self.viewCrunchOut];
            
        } completion:^(BOOL finished) {
            
        }];
        
        
        
    }];
    
    
    
    
}

-(void)didRightDroverDragingBegin
{

}

-(void) didRightDroverDragingEnd
{
    
}

- (IBAction)btnCancelClick:(id)sender
{
    CGRect frame  =[self.view frame];
    frame.origin.x =frame.size.width-80;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.view setFrame:frame];
        
        
    } completion:^(BOOL finished) {
        [self.viewCrunchOut removeFromSuperview];
    }];
    
}

-(void)rightDroverWillClose:(id)sender
{
    
    CGRect frame = [self.view frame];
    frame.origin.x = frame.size.width-80;
    
    [UIView animateWithDuration:.75 animations:^{
        
        [self.view setFrame: frame];
        
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [_delegate didRightDroverDragingEnd];
                         }
                     }
     ];
}


@end

