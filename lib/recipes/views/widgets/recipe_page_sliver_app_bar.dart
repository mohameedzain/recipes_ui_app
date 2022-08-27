import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vikings/core/styles/app_colors.dart';
import 'package:flutter_vikings/core/widgets/app_bar_leading.dart';
import 'package:flutter_vikings/recipes/models/recipe.dart';
import 'package:flutter_vikings/recipes/views/widgets/recipe_page_image.dart';
import 'package:flutter_vikings/recipes/views/widgets/recipe_page_image_bg.dart';

class RecipePageSliderAppBar extends StatelessWidget {
  const RecipePageSliderAppBar({
    Key? key,
    required this.recipe,
    this.expandedHeight = 340,
    this.collapsedHeight = 200,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final Recipe recipe;
  final double? expandedHeight;
  final double? collapsedHeight;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      backgroundColor: Colors.transparent,
      collapsedHeight: collapsedHeight,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: AppColors.getBrightness(recipe.bgColor),
      ),
      leading: AppBarLeading(
        popValue: imageRotationAngle,
        bgColor: AppColors.textColorFromBackground(recipe.bgColor),
      ),
      expandedHeight: expandedHeight == null
          ? null
          : expandedHeight! + MediaQuery.of(context).padding.top,
      flexibleSpace: Stack(
        children: [
          RecipePageImageBg(
            recipe,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(35),
              bottomLeft: Radius.circular(35),
            ),
          ),
          RecipePageImage(
            recipe,
            imageRotationAngle: imageRotationAngle,
          ),
        ],
      ),
    );
  }
}