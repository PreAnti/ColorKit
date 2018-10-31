/**
 * Copyright (c) 2016-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <Foundation/Foundation.h>

#import <IGListKit/IGListAdapterDataSource.h>

#import "IGTestObject.h"

@interface IGTestSingleStoryboardItemDataSource : NSObject <IGListAdapterDataSource>

@property (nonatomic, strong) NSArray <IGTestObject *> *objects;

@end
