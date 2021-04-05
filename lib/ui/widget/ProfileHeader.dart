import 'package:ezorrio_dev/Constants.dart';
import 'package:ezorrio_dev/Extensions.dart';
import 'package:ezorrio_dev/ui/widget/SocialNetworks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileHeader extends StatelessWidget {
  final bool isCompact;
  final String photoUrl;
  final String name;
  final String bio;

  ProfileHeader(this.isCompact, this.name, this.bio, this.photoUrl);

  @override
  Widget build(BuildContext context) => isCompact
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Image.network(
                photoUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(name, style: context.textStyleTitle),
                SizedBox(height: 8),
                Text(bio, style: context.textStyleCaption),
                SizedBox(height: 8),
                SocialNetworks(
                    twitter: SocialNetworkLinks.TWITTER,
                    instagram: SocialNetworkLinks.INSTAGRAM,
                    facebook: SocialNetworkLinks.FACEBOOK,
                    telegram: SocialNetworkLinks.TELEGRAM,
                    linkedin: SocialNetworkLinks.LINKEDIN,
                    github: SocialNetworkLinks.GITHUB,
                    email: SocialNetworkLinks.EMAIL)
              ],
            )
          ],
        )
      : Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Image.network(
                photoUrl,
                height: 64,
                width: 64,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(name, style: context.textStyleTitle),
            SizedBox(height: 8),
            Text(bio, style: context.textStyleCaption),
            SizedBox(height: 8),
            SocialNetworks(
                twitter: SocialNetworkLinks.TWITTER,
                instagram: SocialNetworkLinks.INSTAGRAM,
                facebook: SocialNetworkLinks.FACEBOOK,
                telegram: SocialNetworkLinks.TELEGRAM,
                linkedin: SocialNetworkLinks.LINKEDIN,
                github: SocialNetworkLinks.GITHUB,
                email: SocialNetworkLinks.EMAIL)
          ],
        );
}
