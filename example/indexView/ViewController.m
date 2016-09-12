//
//  ViewController.m
//  indexView
//
//  Created by lihongfeng on 15/10/29.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "WLIndexView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *sectionTitles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.tableView];
    
    
    self.sectionTitles = @[@"A", [UIImage imageNamed:@"test"], @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"K"];
    
    //*******************************************添加索引视图:只需一个初始化方法**************************************
    
    WLIndexView *indexView = [WLIndexView viewWithFrame:CGRectMake(self.view.bounds.size.width-30, 50, 30, 500)
                                            indexTitles:self.sectionTitles
                                              tableView:self.tableView
                                 tableViewSectionsCount:self.sectionTitles.count];
    [self.view addSubview:indexView];
    
    //其它个性化设置
    indexView.isHaveAnimation = YES;
    indexView.titleFont = [UIFont systemFontOfSize:14];
    [indexView setTitleColor:[UIColor redColor] titleIndex:3];
    [indexView setTitleFont:[UIFont systemFontOfSize:25] titleIndex:5];
    indexView.tapIndexTitleBtn = ^(NSInteger titleIndex, NSString *title){
        // 选中某一个title时, 自定义返回某一个section
        return titleIndex;
    };
    
    //*******************************************添加索引视图*********************************************************
    
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableV = [[UITableView alloc] init];
        tableV.frame = self.view.bounds;
        _tableView = tableV;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;

    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionTitles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    label.text = [NSString stringWithFormat:@"section %@", self.sectionTitles[section]];
    label.backgroundColor = [UIColor brownColor];
    [view addSubview:label];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row %ld", (long)indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
}

@end
