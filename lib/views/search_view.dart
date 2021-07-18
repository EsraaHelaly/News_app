import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/cubit/cubit.dart';
import 'package:news_app/core/cubit/states.dart';
import 'package:news_app/views/widgets/build_listview_category.dart';

class SearchView extends StatelessWidget {
  final bool isSearch;
  const SearchView({Key key, this.isSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    onChanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'empty field';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: BuildListViewCategory(list: list,isSearch:true),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
