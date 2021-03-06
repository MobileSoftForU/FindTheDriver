//
//  LogsCellOneTableViewCell.m
//  FindTheDriver
//
//  Created by Prajoth Antonio D'sa on 11/12/15.
//  Copyright © 2015 Endeavour. All rights reserved.
//

#import "LogsCellOneTableViewCell.h"

@implementation LogsCellOneTableViewCell

- (void)awakeFromNib {
    
    self.cycleTextField.layer.cornerRadius=5.0f;
    self.cycleTextField.layer.borderWidth=1.0f;
    self.cycleTextField.layer.borderColor=kGrayColor.CGColor;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
    self.cycleTextField.leftView = paddingView;
    self.cycleTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *dropImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 5, 20, 20)];
    dropImgView.image=[UIImage imageNamed:@"DownArrow"];
    dropImgView.contentMode=UIViewContentModeScaleAspectFit;
    dropImgView.clipsToBounds=YES;
    self.cycleTextField.rightView = dropImgView;
    self.cycleTextField.rightViewMode = UITextFieldViewModeAlways;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
