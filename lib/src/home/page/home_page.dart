import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/core/auth_service.dart';
import 'package:notification/core/extensions/ext_build_context.dart';
import 'package:notification/core/widgets/app_sizer.dart';
import 'package:notification/core/widgets/app_web_view.dart';
import 'package:notification/src/auth/page/auth_page.dart';
import 'package:notification/src/home/controller/home_controller.dart';
import 'package:notification/src/home/models/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:notification/src/home/models/item_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    print(AuthService.loggedInUser.photoURL);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          AuthService.loggedInUser.photoURL != null ||
                  AuthService.loggedInUser.photoURL != ''
              ? InkWell(
                  onTap: () {
                    AuthService.signOut().then((value) {
                      context.showSnackBar('User Signing out');
                      Get.off(const AuthPage());
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: NetworkImage(
                            AuthService.loggedInUser.photoURL ?? ''),
                      ),
                    ),
                  ),
                )
              : Text(AuthService.loggedInUser.uid[0]),
          const WidthBox(15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<HomeController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightBox(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'List of Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      controller.isGridViewShow = !controller.isGridViewShow;
                    },
                    child: const Icon(Icons.filter),
                  )
                ],
              ),
              const HeightBox(10),
              GetBuilder<HomeController>(builder: (controller) {
                return SizedBox(
                  height: 28,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        CategoryModel category = controller.categories[index];
                        return InkWell(
                          onTap: () => controller.selectItem(category),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: controller
                                      .isItemContain(category.category ?? '')
                                  ? const Border()
                                  : Border.all(color: Colors.grey),
                              color: controller
                                      .isItemContain(category.category ?? '')
                                  ? Colors.blue
                                  : Colors.transparent,
                            ),
                            child: Text(
                              category.category ?? '',
                              style: TextStyle(
                                  color: controller.isItemContain(
                                          category.category ?? '')
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const WidthBox(8),
                      itemCount: controller.categories.length),
                );
              }),
              const HeightBox(10),
              if (!controller.isGridViewShow)
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = controller.items[index];
                          return InkWell(
                              onTap: () => Get.to(
                                  () => MyWebView(webUrl: item.eventUrl ?? '')),
                              child: ProductDetailWidget(item: item));
                        },
                        separatorBuilder: (context, index) =>
                            const HeightBox(10),
                        itemCount: controller.items.length,
                      ),
                    );
                  },
                ),
              const HeightBox(10),
              if (controller.isGridViewShow)
                Expanded(
                  child: GetBuilder<HomeController>(builder: (controller) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Get.to(() => MyWebView(
                            webUrl: controller.items[index].eventUrl ?? '')),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl:
                                    controller.items[index].bannerUrl ?? '',
                                fit: BoxFit.cover,
                                height: 130,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress)),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Text(
                              controller.items[index].eventname ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
            ],
          );
        }),
      ),
    );
  }
}

class ProductDetailWidget extends StatelessWidget {
  final Item item;
  const ProductDetailWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: item.bannerUrl ?? '',
                fit: BoxFit.cover,
                height: 100,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const WidthBox(15),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.eventname ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  item.location ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const HeightBox(6),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.save_alt,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
          const WidthBox(10),
        ],
      ),
    );
  }
}
