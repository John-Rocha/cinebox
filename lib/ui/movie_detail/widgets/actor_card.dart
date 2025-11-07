import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String character;

  const ActorCard({
    required this.imageUrl,
    required this.name,
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) {
              return Container(
                padding: EdgeInsets.all(28),
                width: 85,
                height: 85,
                color: AppColors.lightGrey,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            errorWidget: (context, url, error) => Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(R.ASSETS_IMAGES_NO_IMAGE_PNG),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            imageBuilder: (context, imageProvider) {
              return Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Text(
            name,
            style: AppTextStyles.boldSmall.copyWith(fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            character,
            style: AppTextStyles.lightGreySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
