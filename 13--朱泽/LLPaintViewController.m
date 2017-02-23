//
//  LLPaintViewController.m
//  13--朱泽
//
//  Created by locklight on 17/2/23.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLPaintViewController.h"
#import "LLpaintCircleView.h"

static NSString *cellID = @"cellID";

@interface LLPaintViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTB;
@property (weak, nonatomic) IBOutlet LLpaintCircleView *paintCircleView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;


@end

@implementation LLPaintViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    _myTB.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
    _myTB.backgroundColor = [UIColor clearColor];
    
    
    _myTB.dataSource = self;
    _myTB.delegate = self;
    
    [_myTB registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.isDragging | scrollView.decelerating |scrollView.isTracking){
        
        _paintCircleView.offset = scrollView.contentOffset.y;
//        _heightConstraint.constant = (-scrollView.contentOffset.y);
        
//        NSLog(@"%.2f",-scrollView.contentOffset.y);
    }
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行",indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
