//
//  AIPongViewController.h
//  AIPongGame
//
//  Created by Ming on 1/4/14.
//  Copyright (c) 2014 Ming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIPongViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIView *viewPaddle1;
@property (retain, nonatomic) IBOutlet UIView *viewPaddle2;
@property (weak, nonatomic) IBOutlet UIView *viewPuck;

@end
