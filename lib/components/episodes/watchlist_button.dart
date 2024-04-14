import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:vibration/vibration.dart';

const _bookmarkColor = Colors.yellow;

class WatchlistButton extends StatelessWidget {
  const WatchlistButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      likeBuilder: (isLiked) {
        return Icon(
          isLiked ? Icons.bookmark : Icons.bookmark_border,
          color: isLiked ? _bookmarkColor : null,
        );
      },
      circleColor: const CircleColor(
        start: _bookmarkColor,
        end: _bookmarkColor,
      ),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: _bookmarkColor,
        dotSecondaryColor: _bookmarkColor,
      ),
      onTap: (isLiked) async {
        if (!isLiked) {
          // Vibration.vibrate(duration: 100);
          Vibration.vibrate(pattern: [0, 50, 125, 50, 125, 50]);

          // Create snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark),
                  SizedBox(width: 8),
                  Text('Bookmarked'),
                ],
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }

        return !isLiked;
      },
    );
  }
}
