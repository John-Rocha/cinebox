import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/widgets/actor_card.dart';
import 'package:flutter/material.dart';

class CastBox extends StatelessWidget {
  const CastBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(
        context,
      ).copyWith(dividerColor: AppColors.lightGrey.withAlpha(25)),
      child: ExpansionTile(
        title: const Text(
          'Elenco',
          style: AppTextStyles.regularSmall,
        ),
        dense: true,
        tilePadding: EdgeInsets.only(left: 0, right: 0),
        childrenPadding: EdgeInsets.symmetric(vertical: 10),
        children: [
          SizedBox(
            height: 148,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ActorCard(
                  imageUrl:
                      'https://heroisdatv.com.br/wp-content/uploads/2025/07/Quem-sao-os-Hashiras-de-Demon-Slayer.jpg',
                  name: 'Johnathan Rocha',
                  character: 'Hashira do Fogo',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
