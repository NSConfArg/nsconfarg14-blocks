//
//  NATemplateArrayIterator.h
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 3/25/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NAArrayIterator.h"

@interface NATemplateArrayIterator : NSObject <NAArrayIterator>

@property(nonatomic, weak) UITextView *textView;

-(void) runOnArray:(NSArray*) array;
-(void) doEach:(id) object;

@end
