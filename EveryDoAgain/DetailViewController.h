//
//  DetailViewController.h
//  EveryDoAgain
//
//  Created by Josh Endter on 6/29/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Todo;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo *detailItem;

@end

