import 'package:blood4life/App/modules/article/widgets/customCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../core/utils/helperFunctions.dart';
import '../../data/models/articleModel.dart';
import '../../widgets/fistPageErrorIndicator.dart';
import 'controller.dart';

class ArticleScreen extends GetView<ArticleScreenController> {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'مدونتي',
          style: TextStyle(
              fontSize: 24.spMin,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.sync(() => controller.pagingController.refresh());
        },
        child: PagedListView<int, ArticleModel>.separated(
          pagingController: controller.pagingController,
          physics: const BouncingScrollPhysics(),
          builderDelegate: PagedChildBuilderDelegate<ArticleModel>(
            firstPageErrorIndicatorBuilder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    top: getMediaQueryHeight(context: context, value: 250)),
                child: firstPageErrorIndicator(controller, () {
                  controller.pagingController.retryLastFailedRequest();
                }),
              );
            },
            newPageErrorIndicatorBuilder: (context) {
              return InkWell(
                onTap: () {
                  controller.pagingController.retryLastFailedRequest();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("حدث خطأ ما.اضعط للمحاولة مجددا"),
                      Icon(Icons.refresh)
                    ],
                  ),
                ),
              );
            },
            animateTransitions: true,
            itemBuilder: (context, item, index) {
              print(item);
              return CustomCard(
                imageUrl: '${item.imageUrl}',
                title: item.title!,
                supTitle: item.description!,
                articlUrl: item.url!,
              );
            },
          ),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: getMediaQueryHeight(context: context, value: 16),
            );
          },
        ),
      ),
    );
  }
}
