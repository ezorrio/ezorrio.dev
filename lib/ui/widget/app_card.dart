import 'package:ezorrio_dev/extensions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppCard extends StatelessWidget {
  final String title;
  final Widget content;
  final String? link;

  const AppCard({
    super.key,
    required this.title,
    required this.content,
    this.link,
  });

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: context.textStyleBody1.copyWith(color: context.primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (link != null)
                    InkWell(
                      onTap: () async => await canLaunchUrlString(link!)
                          ? await launchUrlString(link!)
                          : throw 'Could not launch $link',
                      child: const Icon(
                        Icons.link,
                        size: 24,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              content,
            ],
          ),
        ),
      );
}
