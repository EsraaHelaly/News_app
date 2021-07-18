import 'package:flutter/material.dart';

import 'build_article_item.dart';

class BuildListViewCategory extends StatelessWidget {
  final List list;
  final bool isSearch;
  const BuildListViewCategory({Key key, this.list, this.isSearch = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return BuildArticleItem(list: list[index]);
            },
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                color: Colors.grey,
              );
            },
            itemCount: list.length)
        : Center(
                child: CircularProgressIndicator(),
              );
  }
}
