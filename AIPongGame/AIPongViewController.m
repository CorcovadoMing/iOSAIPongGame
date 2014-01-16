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

- (BOOL)checkPuckCollision:(CGRect)rect DirX:(float)x DirY:(float)y
{
    if(CGRectIntersectsRect(self.viewPuck.frame, rect))
    {
        if(x != 0)
        {
            dx = x;
        }
        if(y != 0)
        {
            dy = y;
        }
        return true;
    }
    return false;
}

- (BOOL)checkGoal
{
    if(self.viewPuck.center.y < 0 || self.viewPuck.center.y >= 568)
    {
        int s1 = [self.viewScore1.text intValue];
        int s2 = [self.viewScore2.text intValue];
        
        if(self.viewPuck.center.y < 0) s2++; else s1++;
        
        self.viewScore1.text = [NSString stringWithFormat:@"%u", s1];
        self.viewScore2.text = [NSString stringWithFormat:@"%u", s2];
        
        [self reset];
        return true;
    }
    return false;
}


- (void)animate
{
    self.viewPuck.center = CGPointMake(self.viewPuck.center.x + dx*speed, self.viewPuck.center.y + dy*speed);
    
    [self checkPuckCollision:CGRectMake(-10, 0, 20, 568) DirX:fabsf(dx) DirY:0];
    [self checkPuckCollision:CGRectMake(310, 0, 20, 568) DirX:-fabsf(dx) DirY:0];
    
    [self checkPuckCollision:self.viewPaddle1.frame DirX:(self.viewPuck.center.x - self.viewPaddle1.center.x) / 32.0 DirY:1];
    [self checkPuckCollision:self.viewPaddle2.frame DirX:(self.viewPuck.center.x - self.viewPaddle2.center.x) / 32.0 DirY:-1];
    
    [self checkGoal];
}

- (void)reset
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
