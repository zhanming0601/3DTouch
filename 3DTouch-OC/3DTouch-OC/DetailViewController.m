//
//  DetailViewController.m
//  3DTouch-OC
//
//  Created by zhanming on 16/6/13.
//  Copyright © 2016年 zhanming. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    //弹出的第一个按钮
    UIPreviewAction *action0 = [UIPreviewAction actionWithTitle:@"收藏" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"收藏");
        
    }];
    
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"点赞" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点赞");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"试试" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"试试");
    }];
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"星星" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"星星");
    }];
    
    //该按钮可以是一个组,点击该组时,跳到组里面的按钮.
    UIPreviewActionGroup *actionGroup = [UIPreviewActionGroup actionGroupWithTitle:@"组" style:UIPreviewActionStyleSelected actions:@[action2, action3]];
    //直接返回数组.
    return  @[action0,action1,actionGroup];
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
