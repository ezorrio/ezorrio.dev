import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialNetworks extends StatelessWidget {
  final String twitter;
  final String instagram;
  final String telegram;
  final String linkedin;
  final String github;
  final String email;

  final IconData twitterIcon = FontAwesomeIcons.twitter;
  final IconData instagramIcon = FontAwesomeIcons.instagram;
  final IconData telegramIcon = FontAwesomeIcons.telegram;
  final IconData linkedinIcon = FontAwesomeIcons.linkedin;
  final IconData githubIcon = FontAwesomeIcons.github;
  final IconData emailIcon = FontAwesomeIcons.envelope;

  const SocialNetworks(
      {required this.twitter,
      required this.instagram,
      required this.telegram,
      required this.linkedin,
      required this.github,
      required this.email,
      Key? key})
      : super(key: key);

  Widget socialNetworkButton({required IconData icon, required String link}) => IconButton(
        padding: EdgeInsets.zero,
        iconSize: 16,
        icon: FaIcon(
          icon,
          size: 16,
        ),
        onPressed: () async =>
            await canLaunchUrlString(link) ? await launchUrlString(link) : throw 'Could not launch $link',
      );

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          socialNetworkButton(icon: emailIcon, link: email),
          socialNetworkButton(icon: telegramIcon, link: telegram),
          socialNetworkButton(icon: githubIcon, link: github),
          socialNetworkButton(icon: instagramIcon, link: instagram),
          socialNetworkButton(icon: linkedinIcon, link: linkedin),
        ],
      );
}
