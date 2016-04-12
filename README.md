Action介绍
========
Action控件是ios系统中的屏幕底部上拉菜单控件，本人会长期维护优化～

使用方法
========
首先把以下四个文件添加到项目工程里
* NMCustomCell.h
* NMCustomCell.m
* NMActionView.h
* NMActionView.m<br>
然后往要使用此控件的控制器视图头文件加入头文件引用（#import "NMActionView.h"）<br>
最后在视图控制区对actionView初始化,并插入到父视图<br>
-(void)viewDidLoad {<br>
    [super viewDidLoad];<br>
    // Do any additional setup after loading the view, typically from a nib.<br>
     NMActionView  *actionView=[[NMActionView alloc] init];<br>
    [self.view addSubview:actionView];<br>
}<br>

运行效果图
=========

![image](https://github.com/Nemo01/Action//raw/master/Screen Shot.png)

欢迎大家使用～
------------
