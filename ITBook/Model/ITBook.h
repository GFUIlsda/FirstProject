//
//  ITBook.h
//  ITBook
//
//  Created by SkyLORD on 14.06.13.
//  Copyright (c) 2013 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITBook : NSObject
// объявление переменных в проекте:
{
    NSString *_title;
    NSString *_author;
    NSInteger _year;
    BOOL _coverType;
}

// НОВОЕ!!!
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign, getter = isPaperback) BOOL paperback;
@property (nonatomic, assign, getter = isHardcover) BOOL hardcover;
// Закрытое НОВОЕ!!!

// объявление методов обработки в проекте (не понятно почему так дублируем каждую новую строчку):
- (id)initWithTitle:(NSString *)aTitle;
- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor;
- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor year:(NSInteger)aYear;
- (id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor year:(NSInteger)aYear paperback:(BOOL)aCoverType;

// не понятно для чего это:
- (void)setTitle:(NSString *)aTitle;
- (NSString *)title;
- (void)setAuthor:(NSString *)anAuthor;
- (NSString *)author;
- (void)setYear:(NSInteger)aYear;
- (NSInteger)year;
- (void)setPaperback:(BOOL)isPaperback;
- (BOOL)isPaperback;
- (void)setHardcover:(BOOL)isHardcover;
- (BOOL)isHardcover;

// --
- (id)initWithDictionaryRepresentation:(NSDictionary *)aDict;
- (NSDictionary *)dictionaryRepresentation;
// --

- (NSString *)stringRepresentation;

// сортировка вводимых данных
+ (NSArray *)booksSortByTitleWithSet:(NSSet *)aBooks;
+ (NSArray *)booksSortByAuthorWithSet:(NSSet *)aBooks;
+ (NSArray *)booksSortByYearWithSet:(NSSet *)aBooks;

+ (NSArray *)booksSortByTitleWithArray:(NSArray *)aBooks;
+ (NSArray *)booksSortByAuthorWithArray:(NSArray *)aBooks;
+ (NSArray *)booksSortByYearWithArray:(NSArray *)aBooks;

@end
