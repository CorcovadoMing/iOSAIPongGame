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
    [self reset];
    [self start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) animate
{
    self.viewPuck.center = CGPointMake(self.viewPuck.center.x + dx*speed, self.viewPuck.center.y + dy*speed);
}

- (void) reset
{
    if(arc4random() % 2 == 0)
    {
        dx = -1;
    }
    else
    {
        dx = 1;
    }
    
    if(dy != 0)
    {
        dy = -dy;
    }
    else if(arc4random() % 2 == 0)
    {
        dy = -1;
    }
    else
    {
        dy = 1;
    }
    
    self.viewPuck.center = CGPointMake(15+arc4random()%(320-30), 284);
    
    speed = 2;
}

- (void)start
{
    if(timer == nil)
    {
        timer = [NSTimer
                  scheduledTimerWithTimeInterval:1.0/60.0
                  target:self
                  selector:@selector(animate)
                  userInfo:NULL
                  repeats:YES];
    }
    self.viewPuck.hidden = NO;
}

- (void)stop
{
    if(timer != nil)
    {
        [timer invalidate];
        timer = nil;
    }
    self.viewPuck.hidden = YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        CGPoint touchPoint = [touch locationInView:self.view];
        if(touch1 == nil && touchPoint.y < 284)
        {
            touch1 = touch;
            self.viewPaddle1.center = CGPointMake(touchPoint.x, self.viewPaddle1.center.y);
        }
        else if(touch2 == nil && touchPoint.y >= 284)
        {
            touch2 = touch;
            self.viewPaddle2.center = CGPointMake(touchPoint.x, self.viewPaddle2.center.y);
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint touchPoint = [touch locationInView:self.view];
        if(touch == touch1)
        {
            self.viewPaddle1.center = CGPointMake(touchPoint.x, self.viewPaddle1.center.y);
        }
        else if(touch == touch2)
        {
            self.viewPaddle2.center = CGPointMake(touchPoint.x, self.viewPaddle2.center.y);
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *touch in touches)
    {
        if(touch == touch1)
        {
            touch1 = nil;
        }
        else if(touch == touch2)
        {
            touch2 = nil;
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

@end
