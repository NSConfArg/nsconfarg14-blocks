//
//  NABlockMemoryManagementDemo.h
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 4/4/14.
//

#import <Foundation/Foundation.h>

@interface NABlockMemoryManagementDemo : NSObject

@property(nonatomic, copy) void(^myCopiedBlockProperty)(void);
@property(nonatomic, strong) void(^myStrongBlockProperty)(void);
@property(nonatomic, strong) NSArray *blockQueue;

-(void) testMethod;

@end
