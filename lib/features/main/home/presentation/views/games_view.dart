import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/home/model/game_model.dart';
import 'package:courseapp/features/main/home/presentation/widget/games_view_body.dart';
import 'package:flutter/material.dart';

class GamesView extends StatelessWidget {
   GamesView({super.key});
  final List<GameModel> games = [
    GameModel(
      title: "الألغاز",
      imagePath: ImageAssets.puzzel,
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.puzzlegamesclassic.puzzlegame&hl=en",
    ),
    GameModel(
      title: "شطرنج",
      imagePath: ImageAssets.chess,
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.jetstartgames.chess&hl=en&pli=1",
    ),
    GameModel(
      title: "الذاكرة",
      imagePath: ImageAssets.memory,
      playStoreUrl: "http://play.google.com/store/apps/details?id=matching.pairs.memory.game&hl=en",
    ),
    GameModel(
      title: "سكرابل",
      imagePath:ImageAssets.scrabble,
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.pieyel.scrabble&hl=en",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Scaffold(
          body: GamesViewBody(games: games),
        ),
      ],

    );
  }
}



