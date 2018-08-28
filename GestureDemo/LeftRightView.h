//
//  LeftRightView.h
//  GestureDemo
//
//  Created by BillBo on 2018/8/22.
//  Copyright © 2018年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^clickLeftBlock)(BOOL left);
typedef void(^clickRightBlock)(BOOL right);

@interface LeftRightView : UIView

+(LeftRightView *)view;

- (void)clickLeft:(clickLeftBlock)left right:(clickRightBlock)right;

@end
