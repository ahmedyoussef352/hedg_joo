import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/components.dart';
import '../../../../models/plan.dart';
import '../../../moderated_explore_screen/moderated_explore_screen.dart';
import '../../../plan_details_screen/details_plan_screen.dart';
import 'explore_cubit.dart';

class ExploreLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreCubit()..fetchPlans(),
      child: BlocBuilder<ExploreCubit, List<Plan>>(
        builder: (context, plans) => SingleChildScrollView(
          child: Column(
            children: plans.map((plan) => ExploreItem(
              context: context,
              title: plan.title,
              subTitle: plan.shortDescription,
              color: Color(int.parse(plan.color, radix: 16)),
              image: 'assets/images/Conservative.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModeratedExploreScreen(plan: plan),
                  ),
                );
              },
            )).toList(),
          ),
        ),
      ),
    );
  }
}
