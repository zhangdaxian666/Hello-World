//
//  MovieDetailController.m
//  MovieStar
//
//  Created by slcf888 on 2017/12/25.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "MovieDetailController.h"
#import "MovieTableViewCell.h"
#import <Masonry.h>

@interface MovieDetailController () <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *startArray;
}
@property (nonatomic, strong) UITableView *tableview;
@end

@implementation MovieDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    int i;
//    for (i=1; i<11; i++) {
//        NSString *str =[NSString stringWithFormat:@"招商银行:%d",i];
//        [startArray addObject:str];
//    }
    
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.layer.zPosition =indexPath.row;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"BankCardCell"];
    if (!cell) {
        cell =[[MovieTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BankCardCell"];
    }
//    cell.bankNameLabel.text =startArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 93;
}
- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview =[[UITableView alloc]init];
        _tableview.separatorStyle =UITableViewCellSeparatorStyleNone;
        _tableview.delegate =self;
        _tableview.dataSource =self;
    }
    return _tableview;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
