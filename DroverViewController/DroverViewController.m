//
//  DroverViewController.m
//  DroverViewController
//
//  Created by RAHUL on 12/21/15.
//  Copyright © 2015 RAHUL. All rights reserved.
//

#import "DroverViewController.h"

@interface DroverViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnDragging;
@property (strong, nonatomic) IBOutlet UIView *viewCrunchIn;
@property (weak, nonatomic) IBOutlet UIImageView *imgDragging;

@end

@implementation DroverViewController
@synthesize btnDragging;

- (void)viewDidLoad
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
    NSLog(@"%f",frame.x);
    
    
      if (frame.x - self.view.frame.origin.x  < - 40) {
    
        return;
        
    }

    
    float locationDifferent = frame.x - self.view.frame.size.width;
    
    switch (gesture.state)
    {
        case UIGestureRecognizerStateBegan:
        {
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
             NSLog(@"diff == %f",locationDifferent);
            
            if (locationDifferent <0) {
                NSLog(@"hlelo nagative %f",locationDifferent);
                return;
            }
            
            CGRect rect = self.view.frame;
            rect.origin.x = rect.origin.x + locationDifferent;
            self.view.frame = rect;
            
            [_delegate didLeftDroverDragingBegin];
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            if(!(self.view.frame .origin.x <= -self.view.frame.size.width/2)){
                
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
    
    CGRect frame =[self.view frame];
    frame.origin.x=0;
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view setFrame:frame];
        
        
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame =[self.view frame];
            frame.size.width-=40;
            [self.viewCrunchIn setFrame: frame];
            [self.view addSubview:self.viewCrunchIn];
            
        } completion:^(BOOL finished) {
            
        }];
        
       

    }];
    
    
    
  }

-(void)leftDroverWillClose:(id)sender
{
//    [_delegate willHideOtherDrover:NO];
    
    
    CGRect frame = [self.view frame];
    frame.origin.x = -frame.size.width+40;
    
    [UIView animateWithDuration:.75 animations:^{

        [self.view setFrame: frame];
//        isLeftDroverOpened  = NO;
//        drowerImageView.userInteractionEnabled = YES
//        self.frame = rect;
   
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [_delegate didLeftDroverDragingEnd];
                         }
                     }
     ];
}

- (IBAction)btnCancelClick:(id)sender
{
    CGRect frame  =[self.view frame];
    frame.origin.x =-frame.size.width+40;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.view setFrame:frame];
       
        
    } completion:^(BOOL finished) {
         [self.viewCrunchIn removeFromSuperview];
    }];
    
}

@end
