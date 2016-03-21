//
//  SB_MainVC.m
//  SxyPhto
//
//  Created by MacTest on 15/12/29.
//  Copyright © 2015年 yxtk. All rights reserved.
//

#import "SB_MainVC.h"

#define CELL_COUNT 20
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"

@interface SB_MainVC ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@property(nonatomic, strong) GooeySlideMenu * menu;
@property(nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic, strong) NSMutableArray * arr_galleries;
@property(nonatomic, strong) NSArray *cellSizes;
@property(nonatomic, strong) RB_BusinessHandler * mainHandler;

@end

@implementation SB_MainVC

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.minimumColumnSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[MainCell class]
            forCellWithReuseIdentifier:CELL_IDENTIFIER];
//        [_collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
//            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
//                   withReuseIdentifier:HEADER_IDENTIFIER];
//        [_collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
//            forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
//                   withReuseIdentifier:FOOTER_IDENTIFIER];
    }
    return _collectionView;
}

- (NSArray *)cellSizes {
    if (!_cellSizes) {
        _cellSizes = @[
                       [NSValue valueWithCGSize:CGSizeMake(600, 845)],
                       [NSValue valueWithCGSize:CGSizeMake(600, 1005)],
                       [NSValue valueWithCGSize:CGSizeMake(600, 1005)],
                       [NSValue valueWithCGSize:CGSizeMake(600, 845)]
                       ];
    }
    return _cellSizes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SP_MainBusiness * business = [[SP_MainBusiness alloc] init];
    __weak __typeof(self) weakSelf = self;
    self.arr_galleries = [[NSMutableArray alloc] init];
    [business fetchPhotoList:^(id obj) {
        weakSelf.menu = [[GooeySlideMenu alloc]initWithTitles:obj];
        weakSelf.menu.menuClickBlock = ^(NSInteger index,NSString *title,NSInteger titleCounts){
            [business fetchGalleries:@"2" page:2 success:^(id obj) {
                [weakSelf.arr_galleries removeAllObjects];
                [weakSelf.arr_galleries addObjectsFromArray:obj];
                [weakSelf.collectionView reloadData];
            }];
        };
        [self.menu trigger];
    }];
    [self.view addSubview:self.collectionView];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arr_galleries.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([NSArray isAvailableArray:self.arr_galleries]) {
        SP_M_Gallery * gallery = self.arr_galleries[indexPath.row];
//        MainCell * cell = [[MainCell alloc] init];
        MainCell *cell = (MainCell*)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
        [cell.imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://tnfs.tngou.net/img%@", gallery.str_img]]];
        cell.lbl_description.text = gallery.str_title;
        cell.lbl_description.y = cell.height-45;
        return cell;
    }
    return  nil;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    UICollectionReusableView *reusableView = nil;
//    
////    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
////        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
////                                                          withReuseIdentifier:HEADER_IDENTIFIER
////                                                                 forIndexPath:indexPath];
////    } else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]) {
////        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
////                                                          withReuseIdentifier:FOOTER_IDENTIFIER
////                                                                 forIndexPath:indexPath];
////    }
////    
//    return reusableView;
//}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if ([NSArray isAvailableArray:self.arr_galleries]) {
//        SP_M_Gallery * gallery = self.arr_galleries[indexPath.row];
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://tnfs.tngou.net/img%@",gallery.str_img]];
//        UIImage *imagea = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
//        return CGSizeMake(imagea.size.width, imagea.size.height+45);
//    }
//    return CGSizeMake(640, 1005);
    return [self.cellSizes[indexPath.item % 4] CGSizeValue];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
