//
//  AIPongViewController.h
//  AIPongGame
//
//  Created by Ming on 1/4/14.
//  Copyright (c) 2014 Ming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIPongViewController : UIViewController
{
    UITouch *touch1;
    UITouch *touch2;
    
    float dx;
    float dy;
    float speed;
    
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UIView *viewPaddle1;
@property (weak, nonatomic) IBOutlet UIView *viewPaddle2;
@property (weak, nonatomic) IBOutlet UIView *viewPuck;
@property (strong, nonatomic) IBOutlet UILabel *viewScore1;
@property (strong, nonatomic) IBOutlet UILabel *viewScore2;

@end
