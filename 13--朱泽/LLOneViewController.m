//
//  LLOneViewController.m
//  13--朱泽
//
//  Created by locklight on 17/2/23.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLOneViewController.h"
#import "LLProgressView.h"


@interface LLOneViewController ()

@property (weak, nonatomic) IBOutlet LLProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@end

@implementation LLOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (IBAction)changeProgress:(UISlider *)sender {
    self.progressView.progressValue = sender.value / 100;
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f %%",sender.value];
//    NSLog(@"%.2f",sender.value);
    
    [self.progressView setNeedsDisplay];
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
