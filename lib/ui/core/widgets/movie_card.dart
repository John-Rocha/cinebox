import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieCard extends ConsumerStatefulWidget {
  const MovieCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieCardState();
}

class _MovieCardState extends ConsumerState<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 148,
          height: 252,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500//8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 148,
                    height: 184,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    width: 148,
                    height: 184,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                'Nome do Filme',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 4),
              Text(
                '2023',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 50,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(30),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  size: 16,
                ),

                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
