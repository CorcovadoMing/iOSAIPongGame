//
//  AIPongViewController.m
//  AIPongGame
//
//  Created by Ming on 1/4/14.
//  Copyright (c) 2014 Ming. All rights reserved.
//

#import "AIPongViewController.h"

@interface AIPongViewController ()

@end

@implementation AIPongViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        CGPoint touchPoint = [touch locationInView:self.view];
        if(touchPoint.y < 240)
        {
            self.viewPaddle1.center = CGPointMake(touchPoint.x, self.viewPaddle1.center.y);
        }
        else
        {
            self.viewPaddle2.center = CGPointMake(touchPoint.x, self.viewPaddle2.center.y);
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesCancelled");
}

@end
