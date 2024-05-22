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

  IconData get twitterIcon => FontAwesomeIcons.twitter;

  IconData get instagramIcon => FontAwesomeIcons.instagram;

  IconData get telegramIcon => FontAwesomeIcons.telegram;

  IconData get linkedinIcon => FontAwesomeIcons.linkedin;

  IconData get githubIcon => FontAwesomeIcons.github;

  IconData get emailIcon => FontAwesomeIcons.envelope;

  const SocialNetworks({
    required this.twitter,
    required this.instagram,
    required this.telegram,
    required this.linkedin,
    required this.github,
    required this.email,
    super.key,
  });

  Widget socialNetworkButton({required IconData icon, required String label, required String link}) => TextButton.icon(
    icon: FaIcon(icon, size: 16),
        label: Text(label),
        // child: Row(
        //   children: [
        //     FaIcon(icon, size: 16),
        //     const SizedBox(width: 8),
        //     Text(label),
        //   ],
        // ),
        onPressed: () async =>
            await canLaunchUrlString(link) ? await launchUrlString(link) : throw 'Could not launch $link',
      );

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            socialNetworkButton(icon: emailIcon, label: 'Email me', link: email),
            // const SizedBox(width: 16),
            // socialNetworkButton(icon: telegramIcon, label: 'Telegram', link: telegram),
            const SizedBox(width: 16),
            socialNetworkButton(icon: githubIcon, label: 'GitHub', link: github),
            const SizedBox(width: 16),
            socialNetworkButton(icon: linkedinIcon, label: 'LinkedIn', link: linkedin),
          ],
        ),
      );
}
