//
//  ViewController.m
//  GestureDemo
//
//  Created by BillBo on 2018/8/22.
//  Copyright © 2018年 BillBo. All rights reserved.
//

#import "ViewController.h"

#import "UpDownView.h"
#import "LeftRightView.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *leftV;
@property (weak, nonatomic) IBOutlet UIView *rightV;
@property (weak, nonatomic) IBOutlet UILabel *directionLB;

/**
 定时器
 */
@property (nonatomic, strong)  NSTimer *timer;

/**
 上下
 */
@property (nonatomic, strong) UpDownView * upDownV;
/**
 左右
 */
@property (nonatomic, strong) LeftRightView * leftRightV;
/**
 
 */
@property (nonatomic, assign) BOOL  up;
@property (nonatomic, assign) BOOL  down;
@property (nonatomic, assign) BOOL  left;
@property (nonatomic, assign) BOOL  right;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.upDownV = [UpDownView view];
    self.upDownV.frame = self.leftV.bounds;
    [self.leftV addSubview:self.upDownV];
    
    [self.upDownV clickUp:^(BOOL up) {
      
        self.up = up;
        [self startControl];
        
    } down:^(BOOL down) {
       
        self.down = down;
        [self startControl];

    }];
    
    self.leftRightV = [LeftRightView view];
    self.leftRightV.frame = self.rightV.bounds;
    [self.rightV addSubview:self.leftRightV];
    
    [self.leftRightV clickLeft:^(BOOL left) {
        self.left = left;
        [self startControl];

    } right:^(BOOL right) {
        self.right = right;
        [self startControl];

    }];
    
}


- (void)long2:(UILongPressGestureRecognizer *)long2 {
    
    NSLog(@"long2");

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    return YES;
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
    
}

- (void)startControl {
    
    if (self.up || self.down || self.left || self.right) {
        [self start];
        return;
    }
    
    [self releaseTimer];

}

- (void)start {
    
    if (!self.timer) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(work) userInfo:nil repeats:YES];
        
        [self.timer fire];
    }
    
}

- (void)releaseTimer {
    
    if (self.timer) {
        
        [self.timer invalidate];
        self.timer = nil;
        
    }
    
    self.directionLB.text = @"停止";
}

- (void)work {
    
    NSString *directionString = @"";

    if (_up) {
       
        directionString = _left ? @"左前" : (_right ? @"右前" : @"向前");
        self.directionLB.text = directionString;
        return;
    }
    
    if (_down) {
        
        directionString = _left ? @"左后" : (_right ? @"右后" : @"向后");
        self.directionLB.text = directionString;
        return;
    }
    
    if (_left) {
        
        directionString = @"向左";
        self.directionLB.text = directionString;
        return;
    }
    
    if (_right) {
        
        directionString = @"向右";
        self.directionLB.text = directionString;
        return;
    }
    
    
}

@end
