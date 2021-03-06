//
//  LogsInfoViewController.m
//  FindTheDriver
//
//  Created by Ganesh Korada on 05/12/15.
//  Copyright © 2015 Endeavour. All rights reserved.
//

#import "LogsInfoViewController.h"
#import "CustomLogsInfoTableViewCell.h"
#import "TodayLogViewController.h"
#import "MFSideMenu.h"

@interface LogsInfoViewController ()  {

}

@property (weak, nonatomic) IBOutlet UITableView *logInfoTblView;
@property (weak, nonatomic) IBOutlet UIView *topGraphView;

@end

@implementation LogsInfoViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden  = NO;
    [self loadLogsViewComponents];
    if (UIAppDelegate.isSideBarInspectLogsClicked == YES) {
        UITabBarController *tabbarVC = [[UIStoryboard storyboardWithName:@"LogsStoryboard" bundle: [NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LogsTabBarID"];
        [tabbarVC setSelectedIndex:2];
        [self presentViewController:tabbarVC animated:NO completion:nil];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.revealViewController panGestureRecognizer];
    GraphView *grapView=[GraphView sharedComponent];
    [self.topGraphView addSubview:grapView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.revealViewController removePanGestureRecognizer];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User defined methods

- (IBAction)sideBarBtnClicked:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (void)loadLogsViewComponents {
    [self setBackBarButtonItem];
    [self setNavigationBarNameWithNameAttribute:@"Logs"];
}

- (IBAction)calenderBtnClicked:(id)sender {
    CustomLogSearchViewController *myController = [kLogsStoryboard instantiateViewControllerWithIdentifier:@"LogSearchID"];
    self.customLogSearchViewController = myController;

    [self.navigationController.view addSubview:self.customLogSearchViewController.view];
    [self.customLogSearchViewController viewWillAppear:NO];
}

- (IBAction)logsScaleTransaparentBtnClicked:(id)sender {
    UITabBarController *tabbarVC = [[UIStoryboard storyboardWithName:@"LogsStoryboard" bundle: [NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LogsTabBarID"];
    [self presentViewController:tabbarVC animated:NO completion:nil];
//    [UIAppDelegate.navigationController pushViewController:tabbarVC animated:YES];
}

#pragma mark - Tableview Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *logInfoCellID = @"LogInfoCellID";
    
    CustomLogsInfoTableViewCell *customLogInfoCell = (CustomLogsInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:logInfoCellID];
    return customLogInfoCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
