//
//  Deck.m
//  Cards
//
//  Created by hcc on 16/6/10.
//  Copyright © 2016年 linbao. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
-(void) addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

-(Card *) drawRandomCard
{
    Card *cardRandom = nil;
    
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        cardRandom = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return cardRandom;
}

@end