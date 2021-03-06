//
//  BKRInfoViewController.m
//  General Aviation
//
//  Created by Alex Burov on 1/8/15.
//
//

#import "BKRHelpViewController.h"

@interface BKRHelpViewController ()
@property (strong, nonatomic) UIView *toolBar;
@end

#define TOOLBAR_HEIGHT 50.0f
#define BUTTON_HEIGHT 40.0f
#define BUTTON_WIDTH 80.0f
#define STATUS_HEIGHT 20.0f

@implementation BKRHelpViewController

- (instancetype)initWithRequest:(NSURLRequest *)request
{
    self = [super init];
    if (self) {
        self.request = request;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.toolBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), TOOLBAR_HEIGHT + STATUS_HEIGHT)];
    self.toolBar.backgroundColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0f];
    self.toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    //[self.view addSubview:self.toolBar];
    
    UIButton *disMissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    disMissButton.frame = CGRectMake(5, STATUS_HEIGHT, BUTTON_WIDTH, BUTTON_HEIGHT);
    disMissButton.backgroundColor = [UIColor clearColor];
    [disMissButton addTarget:self action:@selector(disMissButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [disMissButton setImage:[UIImage imageNamed:@"closeh"] forState:UIControlStateNormal];
    [disMissButton setImage:[UIImage imageNamed:nil] forState:UIControlStateHighlighted];
    [self.view addSubview:disMissButton];
    
    
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
                    //nitWithFrame:CGRectMake(0, CGRectGetHeight(self.toolBar.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - CGRectGetHeight(self.toolBar.bounds))];
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin   |
                                    UIViewAutoresizingFlexibleWidth        |
                                    UIViewAutoresizingFlexibleRightMargin  |
                                    UIViewAutoresizingFlexibleTopMargin    |
                                    UIViewAutoresizingFlexibleHeight       |
                                    UIViewAutoresizingFlexibleBottomMargin ;
    [self.webView loadRequest:self.request];
    
    [self.view addSubview:self.webView];
    [self.view bringSubviewToFront:disMissButton];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)disMissButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:NULL];
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
