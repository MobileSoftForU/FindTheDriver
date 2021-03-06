//
//  Forgot PasswordViewController.m
//  FindTheDriver
//
//  Created by Ganesh Korada on 11/12/15.
//  Copyright © 2015 Endeavour. All rights reserved.
//

#import "Forgot PasswordViewController.h"

@interface Forgot_PasswordViewController ()

@property (weak, nonatomic) IBOutlet UIButton *sendYourInstructions;
@property (weak, nonatomic) IBOutlet UIView *forgotPwdView;
@property (weak, nonatomic) IBOutlet UIView *resetPwdView;
@property (weak, nonatomic) IBOutlet UIView *emailSentView;

@end

@implementation Forgot_PasswordViewController
@synthesize userName;

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _resetPwdView.hidden = NO;
    _emailSentView.hidden = YES;
    [self slideIn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
}

#pragma mark - User Action methods

- (IBAction)closeBtnClicked:(id)sender {
    [self slideOut];
}

- (IBAction)sendInstructionBtnClicked:(id)sender {
    [[CustomLoaderView sharedView] showLoader];
    [[PasswordResetModel alloc]passwordResetAPICall:[NSString stringWithFormat:@"%@",userName] completionBlock:^(BOOL success, NSString *message, id dataDict) {
        [[CustomLoaderView sharedView] dismissLoader];
        if (success) {
            DEBUGLOG(@"message ->%@ dataDict ->%@",message,dataDict);
            _resetPwdView.hidden = YES;
            _emailSentView.hidden = NO;
            [self showAlert:@"" message:message];
            [self slideOut];
        }else{
            [self showAlert:@"" message:message];
            [self slideOut];
        }
    }];
}

- (void)slideIn {
    //set initial location at bottom of view
    CGRect frame = self.forgotPwdView.frame;
    frame.origin = CGPointMake(0.0, self.view.bounds.size.height);
    self.forgotPwdView.frame = frame;
    [self.view addSubview:self.forgotPwdView];
    
    //animate to new location, determined by height of the view in the NIB
    [UIView beginAnimations:@"presentWithSuperview" context:nil];
    frame.origin = CGPointMake(0.0, self.view.bounds.size.height - self.forgotPwdView.bounds.size.height);
    
    self.forgotPwdView.frame = frame;
    _forgotPwdView.clipsToBounds = YES;
    [SCUIUtility setLayerForView:_forgotPwdView WithColor:kClearColor];
    [SCUIUtility setLayerForView:_sendYourInstructions WithColor:kClearColor];
    [UIView commitAnimations];
}

- (void) slideOut {
    //do what you need to do with information gathered from the custom action sheet. E.g., apply data filter on parent view.
    
    [UIView beginAnimations:@"removeFromSuperviewWithAnimation" context:nil];
    
    // Set delegate and selector to remove from superview when animation completes
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:)];
    
    // Move this view to bottom of superview
    CGRect frame = self.forgotPwdView.frame;
    frame.origin = CGPointMake(0.0, self.view.bounds.size.height);
    self.forgotPwdView.frame = frame;
    
    [UIView commitAnimations];
}

// Method called when removeFromSuperviewWithAnimation's animation completes
- (void)animationDidStop:(NSString *)animationID {
    if ([animationID isEqualToString:@"removeFromSuperviewWithAnimation"]) {
        [self.view removeFromSuperview];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
