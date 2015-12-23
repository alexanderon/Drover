//
//  DroverRightViewController.h
//  DroverViewController
//
//  Created by RAHUL on 12/23/15.
//  Copyright © 2015 RAHUL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DroverRightDelegate.h"

@interface DroverRightViewController : UIViewController<DroverRightDelegate>

@property (strong, nonatomic) IBOutlet UIView *viewCrunchOut;
@property (weak, nonatomic) IBOutlet UIImageView *imgDragging;

@property(weak,nonatomic) id<DroverRightDelegate> delegate;

@end
