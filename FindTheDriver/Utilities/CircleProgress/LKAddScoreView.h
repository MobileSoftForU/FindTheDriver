//
//  LKAddScoreView.h
//  
//
//  Created by ljh on 14-3-3.
//  Copyright (c) 2014年 linggan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKAddScoreView : UIImageView

+(instancetype)shareInstance;

//-(void)showMessage:(NSString*)message subMes:(NSString*)subMes fromScore:(float)from toScore:(float)to;
-(void)showMessage:(NSString *)message subMes:(NSString *)subMes fromScore:(float)from toScore:(float)to WithView:(UIView *)view;
-(void)dismiss;
@end