//
//  Todo.h
//  EveryDoAgain
//
//  Created by Josh Endter on 6/29/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

// Is this where I should be keeping the enum?
// Change to a NSEnum
typedef enum {
    PriorityLow,
    PriorityMedium,
    PriorityHigh
} Priority;

@interface Todo : NSManagedObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * todoDescription;
@property (nonatomic, strong) NSNumber * priority;
@property (nonatomic, strong) NSNumber * completed;
@property (nonatomic, strong) NSDate * timeStamp;

@end
