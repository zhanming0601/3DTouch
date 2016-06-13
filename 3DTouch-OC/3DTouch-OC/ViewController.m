//
//  ViewController.m
//  3DTouch-OC
//
//  Created by zhanming on 16/6/13.
//  Copyright © 2016年 zhanming. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "DetailViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[_myTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"zhan"];
    self.myTableView.rowHeight=150;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"zhan" forIndexPath:indexPath];
    //判断是否支持3DTouch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        //注册Cell支持3DTouch,并设置代理
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    
    return cell;
    
}
    
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    //获取sourceView
    MyTableViewCell *cell = (MyTableViewCell *)[previewingContext sourceView];
    //设置弹出预览的位置(peek是从哪个位置弹出)
    [previewingContext setSourceRect:cell.bounds];
    //设置弹框的View.
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    DetailViewController *detailVC = [sb instantiateViewControllerWithIdentifier:@"DetailViewController"];
    //设置弹出peek的高度(设置宽度是没有效果的)
    detailVC.preferredContentSize = CGSizeMake(0, self.view.bounds.size.height*0.6);
    //取出Cell的模型传递给详情控制器.
    
    return detailVC;
    //设置标题
    //detailVC.title = @"帅";
    //在这里想弹一个带有导航条的控制器,控制器里面包装一个导航条.直接返回导航控制器.那么就会peek出一个导航控制器.

    //return [[UINavigationController alloc] initWithRootViewController:detailVC];
}

-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    //*******如果上面返回的是导航控制器*********
    
    //获取导航控制器的根控制器.因为当前已经是一个导航控制器了,不能再继续push一个导航控制器,所以要先获取peek的导航控制器里面的根控制器.
    //然后再拿当前的控制器把获取的控制器push进去.
    
    //DetailViewController *detailVC = (DetailViewController*)viewControllerToCommit.childViewControllers.lastObject;
    
    //*******如果上面返回的是导航控制器*********
    
    DetailViewController *detailVC = (DetailViewController*)viewControllerToCommit;//.childViewControllers.lastObject;
    [self.navigationController pushViewController:detailVC animated:YES];
    
    //使用show和push是一样的效果
    //[self showViewController:viewControllerToCommit sender:self];
}



@end
