//
//  NABlockyArrayIterator.m
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 3/25/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NAArrayIterator.h"

typedef void(^NABlockyArrayIteratorDoEachBlock)(id object);

//typedef id(^NABlockyArrayIteratorDoEachReturnBlock)(id object);

@interface NABlockyArrayIterator : NSObject <NAArrayIterator>

@property(nonatomic, copy) NABlockyArrayIteratorDoEachBlock doEachBlock;

-(void) runOnArray:(NSArray*) array;

@end
