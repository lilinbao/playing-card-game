//
//  CardMatchingGame.h
//  Cards
//
//  Created by hcc on 16/6/11.
//  Copyright © 2016年 linbao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype) initWithCardCount:(NSUInteger)count unsignedCard:(Deck *) deck;
-(Card *) cardAtIndex:(NSUInteger) index;
-(void) chooseCardAtIndex: (NSUInteger) index;
@property (nonatomic,readonly) int score;
@end