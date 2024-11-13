import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/message/model/message_profile_model.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:flutter/material.dart';

class MessagesUserCard extends StatelessWidget {
  const MessagesUserCard({required this.messageProfileModel, super.key});
  final MessageProfileModel messageProfileModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.router.push(ChatRoute(
              roomId: messageProfileModel.roomId,
              chatWithUser: messageProfileModel));
        },
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: Image.network(
            CreateImageUrl.instance
                .photo(messageProfileModel.profilePicture),
          ).image,
        ),
        title: Text(
          messageProfileModel.fullName!,
          style: context.textTheme.labelLarge
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
