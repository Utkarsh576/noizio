import 'package:flutter/material.dart';
import '../app/theme/app_colors.dart';

class SongCard extends StatelessWidget {
  final bool isHorizontal;
  const SongCard({super.key, this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: isHorizontal ? 12 : 0,
        bottom: isHorizontal ? 0 : 12,
      ),
      child: Container(
        width: isHorizontal ? 120 : double.infinity,
        height: isHorizontal ? 150 : 70,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment:
          isHorizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: isHorizontal ? 120 : 70,
                width: isHorizontal ? 120 : 70,
                color: Colors.grey[800],
                child: const Icon(Icons.music_note, color: Colors.white),
              ),
            ),
            if (!isHorizontal) ...[
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Sample Song Title',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
