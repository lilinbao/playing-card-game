//
//  ViewController.h
//  Cards
//
//  Created by hcc on 16/6/10.
//  Copyright © 2016年 linbao. All rights reserved.
//

//Abstract class, must be implement methods as described below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController
//protected for subclasses
- (Deck *)createDeck; //abstract
@end

