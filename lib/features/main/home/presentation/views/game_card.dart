import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/main/home/model/game_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GameCard extends StatelessWidget {
  final GameModel game;

  const GameCard({super.key, required this.game});

  Future<void> _openPlayStore() async {
    final Uri url = Uri.parse(game.playStoreUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch ${game.playStoreUrl}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child:  Image.asset(
            game.imagePath,
            fit: BoxFit.cover,
          ),
        ),

        Text(game.title, style: getBoldStyle(color: ColorManager.primary700,fontSize: 18)),
        const SizedBox(height: 6),
        CustomButton(onTap:_openPlayStore, text: "أبدأ",color: ColorManager.primary700,)
      ],
    );
  }
}
