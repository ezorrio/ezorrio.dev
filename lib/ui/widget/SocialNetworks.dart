import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialNetworks extends StatelessWidget {
  final String twitter;
  final String instagram;
  final String facebook;
  final String telegram;
  final String linkedin;
  final String github;
  final String email;

  final IconData twitter_icon = FontAwesomeIcons.twitter;
  final IconData instagram_icon = FontAwesomeIcons.instagram;
  final IconData facebook_icon = FontAwesomeIcons.facebook;
  final IconData telegram_icon = FontAwesomeIcons.telegram;
  final IconData linkedin_icon = FontAwesomeIcons.linkedin;
  final IconData github_icon = FontAwesomeIcons.github;
  final IconData email_icon = Icons.email;

  SocialNetworks(
      {required this.twitter,
      required this.instagram,
      required this.facebook,
      required this.telegram,
      required this.linkedin,
      required this.github,
      required this.email});

  Widget socialNetworkButton({required IconData icon, required String link}) =>
      IconButton(
        icon: FaIcon(
          icon,
          size: 16,
        ),
        onPressed: () async => await canLaunch(link)
            ? await launch(link)
            : throw 'Could not launch $link',
      );

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          socialNetworkButton(icon: email_icon, link: email),
          socialNetworkButton(icon: facebook_icon, link: facebook),
          socialNetworkButton(icon: github_icon, link: github),
          socialNetworkButton(icon: instagram_icon, link: instagram),
          socialNetworkButton(icon: linkedin_icon, link: linkedin),
          socialNetworkButton(icon: telegram_icon, link: telegram),
        ],
      );
}
