//
//  UpDownView.h
//  GestureDemo
//
//  Created by BillBo on 2018/8/22.
//  Copyright © 2018年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickUpBlock)(BOOL up);
typedef void(^clickDownBlock)(BOOL down);


@interface UpDownView : UIView

+ (UpDownView *)view;

- (void)clickUp:(clickUpBlock)up down:(clickDownBlock)down;

@end
