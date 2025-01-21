import 'package:fikril_siesta_technical_test/_core/presentation/component/colors/slate_color.dart';
import 'package:fikril_siesta_technical_test/_core/presentation/component/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/product_model.dart';
import '../component/gallery_modal.dart';
import '../component/product_card.dart';
import 'package:get/get.dart';
import '../component/product_skeleton.dart';
import '../component/success_notification.dart';
import '../controller/product_controller.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          !productController.isLoading.value) {
        productController.fetchProducts();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TypographyStyles.h5(
          'Product List',
          color: Slate.slate900,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SafeArea(
        child: Obx(() {
          if (productController.isLoading.value && productController.products.isEmpty) {
            return ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 32.h),
                  child: const ProductSkeleton(),
                );
              },
            );
          }

          if (productController.products.isEmpty) {
            return const Center(child: Text('No products available.'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              await productController.refreshProducts();
              if (!productController.isRefreshing.value) {
                CustomNotification.show(
                  context,
                  message: 'Refresh Successful!',
                );
              }
            },
            child: ListView.builder(
              controller: scrollController,
              itemCount: productController.products.length + 1,
              itemBuilder: (context, index) {
                if (index < productController.products.length) {
                  final Product product = productController.products[index];
                  return ProductCard(
                    imageUrl: product.images.isNotEmpty ? product.images.first : '',
                    price: '\$${product.price}',
                    title: product.title,
                    description: product.description,
                    onTap: () => _showGalleryModal(context, product.images),
                  );
                } else {
                  return productController.isLoading.value
                      ? Padding(
                          padding: EdgeInsets.all(16.w),
                          child: const ProductSkeleton(),
                        )
                      : const SizedBox.shrink();
                }
              },
            ),
          );
        }),
      ),
    );
  }

  void _showGalleryModal(BuildContext context, List<String> images) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GalleryModal(images: images),
    );
  }
}
