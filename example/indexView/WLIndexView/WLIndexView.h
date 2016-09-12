//
//  WLIndexView.h
//
//  Created by wanglei on 15/10/29.
//  Copyright © 2015年 wanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSInteger (^tapBlock) (NSInteger titleIndex, NSString *title);

@interface WLIndexView : UIView

@property (nonatomic, strong) NSArray *indexTitles;      //索引标题数组,可接受 NSString 或 UIImage 类型
@property (nonatomic, strong) tapBlock tapIndexTitleBtn; //点击或滑动到某一个索引button的block回调
@property (nonatomic, assign) BOOL isHaveAnimation;      //切换section时是否有动画

@property (nonatomic, strong) UIColor *viewBackgroundColor;   //背景色
@property (nonatomic, strong) UIColor *titleColor;            //索引标题颜色
@property (nonatomic, strong) UIFont *titleFont;              //索引标题字体

/**
 *  便利构造器初始化方法
 *
 *  @param frame         索引视图的 frame
 *  @param indexTitles   索引标题的数组, 可以是 NSString 或 UIImage 类型的对象
 *  @param tableView     索引所要关联的 tableView
 *  @param sectionsCount 所要关联的tableView的section数量, sectionsCount必须大于或等于indexTitles数量
 */
+ (instancetype)viewWithFrame:(CGRect)frame indexTitles:(NSArray *)indexTitles tableView:(UITableView *)tableView tableViewSectionsCount:(NSInteger)sectionsCount;

/**
 *  单独设置某一个索引标题的颜色
 */
- (void)setTitleColor:(UIColor *)titleColor titleIndex:(NSInteger)index;

/**
 *  单独设置某一个索引标题的字体
 */
- (void)setTitleFont:(UIFont *)titleFont titleIndex:(NSInteger)index;

@end
