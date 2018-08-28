//
//  UpDownView.m
//  GestureDemo
//
//  Created by BillBo on 2018/8/22.
//  Copyright © 2018年 BillBo. All rights reserved.
//

#import "UpDownView.h"

@interface UpDownView() {
    
    BOOL up;
    BOOL down;
    
}

@property (weak, nonatomic) IBOutlet UIButton *upBtn;
@property (weak, nonatomic) IBOutlet UIButton *downBtn;

/**
 回调
 */
@property (nonatomic, copy) clickUpBlock  clickUp;
@property (nonatomic, copy) clickDownBlock  clickDown;

@end

@implementation UpDownView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self.upBtn addTarget:self action:@selector(up1:) forControlEvents:UIControlEventTouchDown];
    [self.upBtn addTarget:self action:@selector(up2:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];

    
    
    [self.downBtn addTarget:self action:@selector(down1:) forControlEvents:UIControlEventTouchDown];
    [self.downBtn addTarget:self action:@selector(down2:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];

}

+(UpDownView *)view {
    
    return [[NSBundle mainBundle] loadNibNamed:@"UpDownView" owner:self options:nil].firstObject;
}

- (void)up1:(UIButton *)btn {
    
    up = YES;
    [self controlBtn];
    if (self.clickUp) {
        self.clickUp(up);
    }
}

- (void)up2:(UIButton *)btn {
    
    up = NO;
    [self controlBtn];
    if (self.clickUp) {
        self.clickUp(up);
    }
    
}

- (void)down1:(UIButton *)btn {
    down = YES;
    [self controlBtn];
    if (self.clickDown) {
        
        self.clickDown(down);
    }
    
}

- (void)down2:(UIButton *)btn {
    
    down = NO;
    [self controlBtn];
    
    if (self.clickDown) {
        self.clickDown(down);
    }
    
}

- (void)controlBtn {
    
   self.downBtn.userInteractionEnabled = !up;
    self.upBtn.userInteractionEnabled = !down;

}
- (void)clickUp:(clickUpBlock)up down:(clickDownBlock)down{

    self.clickUp = up;
    self.clickDown = down;
}

@end
