import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/cubit/cubit.dart';
import 'package:news_app/core/cubit/states.dart';

import 'widgets/build_listview_category.dart';

class SportsView extends StatelessWidget {
  const SportsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = NewsCubit.get(context).sports;

        return BuildListViewCategory(list: list);
      },
    );
  }
}
