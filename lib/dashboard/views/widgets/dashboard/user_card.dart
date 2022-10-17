import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/auth/controllers/auth_provider.dart';

class UserCard extends ConsumerWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Read user data and show
    final user =
        ref.watch(authControllerProvider.select((value) => value.fbUser));
    final name = user?.displayName ?? '';
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello $name',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'What are you cooking today?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffA9A9A9),
                ),
              ),
            ],
          ),
        ),
        // CachedNetworkImage
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: user?.photoURL ?? '',
            width: 55,
            height: 55,
          ),
        )
      ],
    );
  }
}
