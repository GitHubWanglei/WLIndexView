# WLIndexView
自定义 tableView 右侧索引视图

示例代码:


//*******************************************添加索引视图:只需一个初始化方法**************************************
    
    self.sectionTitles = @[@"A", [UIImage imageNamed:@"test"], @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"K"];
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
    indexView.tapIndexTitleBtn = ^(NSInteger index, NSString *title){
        // 选中某一个title时, 自定义返回某一个section
        return index;
    };
    
    //*******************************************添加索引视图*********************************************************
    
    
