//
//  CTHomeViewController.m
//  CTMVVM
//
//  Created by AllenQin on 16/3/25.
//  Copyright © 2016年 AllenQin. All rights reserved.
//

#import "CTHomeViewController.h"
#import "HomeViewModel.h"
#import "CThomeTableCell.h"

@interface CTHomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView   *tableView;
@property (strong, nonatomic) NSArray *publicModelArray;

@end

@implementation CTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];

    HomeViewModel *publicViewModel = [[HomeViewModel alloc] init];
    [publicViewModel setBlockWithReturnBlock:^(id returnValue) {
        
        [SVProgressHUD dismiss];
        _publicModelArray = returnValue;
        [self.tableView reloadData];
        
    } WithErrorBlock:^(id errorCode) {
        
        [SVProgressHUD dismiss];
        
    } WithFailureBlock:^{
        
        [SVProgressHUD dismiss];
        
    }];
    
    [publicViewModel fetchPublicWeiBo];
    
    [SVProgressHUD showWithStatus:@"正在获取用户信息……" maskType:SVProgressHUDMaskTypeBlack];
}


- (void)initTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =[UIColor clearColor];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = HEIGHT_SCALE(60);
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[CThomeTableCell class] forCellReuseIdentifier:@"homeCell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _publicModelArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewAutomaticDimension;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CThomeTableCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"homeCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.backgroundColor = [UIColor whiteColor];
    [cell setValueWithDic:_publicModelArray[indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
