//
//  LeftRightView.m
//  GestureDemo
//
//  Created by BillBo on 2018/8/22.
//  Copyright © 2018年 BillBo. All rights reserved.
//

#import "LeftRightView.h"

@interface LeftRightView() {
    
    BOOL _left;
    BOOL _right;
}

/**
 回调
 */
@property (nonatomic, copy) clickLeftBlock  leftBlock;
@property (nonatomic, copy) clickRightBlock  rightBlock;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end

@implementation LeftRightView

+ (LeftRightView *)view {
    return [[NSBundle mainBundle] loadNibNamed:@"LeftRightView" owner:self options:nil].firstObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.leftBtn addTarget:self action:@selector(left1:) forControlEvents:UIControlEventTouchDown];
    [self.leftBtn addTarget:self action:@selector(left2:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    
    
    
    [self.rightBtn addTarget:self action:@selector(right1:) forControlEvents:UIControlEventTouchDown];
    [self.rightBtn addTarget:self action:@selector(right2:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];

}

- (void)clickLeft:(clickLeftBlock)left right:(clickRightBlock)right {
    
    self.leftBlock = left;
    self.rightBlock = right;
    
}

- (void)left1:(UIButton *)sender {
    _left = YES;
    [self controlBtn];
    if (self.leftBlock) {
        self.leftBlock(_left);
    }
}


- (void)left2:(UIButton *)sender {
    _left = NO;
    [self controlBtn];
    if (self.leftBlock) {
        self.leftBlock(_left);
    }

}


- (void)right1:(UIButton *)sender {
    _right = YES;
    [self controlBtn];
    if (self.rightBlock) {
        self.rightBlock(_right);
    }

}


- (void)right2:(UIButton *)sender {
    _right = NO;
    [self controlBtn];
    if (self.rightBlock) {
        self.rightBlock(_right);
    }

}



- (void)controlBtn {
    
    self.leftBtn.userInteractionEnabled = !_right;
    self.rightBtn.userInteractionEnabled = !_left;
    
}
@end
