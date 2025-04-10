import 'package:courseapp/features/main/home/model/game_model.dart';
import 'package:courseapp/features/main/home/presentation/views/game_card.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GamesViewBody extends StatelessWidget {
  const GamesViewBody({
    super.key,
    required this.games,
  });

  final List<GameModel> games;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomRowAppBarTitle(title: "الألعاب"),
        Column(
          children: [
            SizedBox(height: 80.h,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  itemCount: games.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 16,
                    childAspectRatio: .6,
                  ),
                  itemBuilder: (context, index) => GameCard(game: games[index]),
                ),
              ),
            ),
          ],
        ),
        const CustomAppBar(),
      ],
    );
  }
}