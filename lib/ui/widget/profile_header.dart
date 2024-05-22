import 'package:ezorrio_dev/resource/data_repository.dart';
import 'package:ezorrio_dev/ui/widget/social_networks.dart';
import 'package:ezorrio_dev/ui/widget/theme_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  Widget _onCorner(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.topRight,
          child: child,
        ),
      );

  Widget socialNetworks(BuildContext context) => SocialNetworks(
        twitter: RepositoryProvider.of<DataRepository>(context).networkLinks.twitter,
        instagram: RepositoryProvider.of<DataRepository>(context).networkLinks.instagram,
        telegram: RepositoryProvider.of<DataRepository>(context).networkLinks.telegram,
        linkedin: RepositoryProvider.of<DataRepository>(context).networkLinks.linkedin,
        github: RepositoryProvider.of<DataRepository>(context).networkLinks.github,
        email: RepositoryProvider.of<DataRepository>(context).networkLinks.email,
      );

  Widget name(BuildContext context) => Text(
        RepositoryProvider.of<DataRepository>(context).name,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      );

  Widget nickname(BuildContext context) => Text(RepositoryProvider.of<DataRepository>(context).nickname);

  Widget description(BuildContext context) => Text(
        RepositoryProvider.of<DataRepository>(context).jobTitle,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)
      );

  Widget profile(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 4),
          name(context),
          const SizedBox(height: 8),
          description(context),
          const SizedBox(height: 8),
          socialNetworks(context),
        ],
      );

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          _onCorner(IconButton(
            icon: const Icon(Icons.bedtime_outlined, size: 16),
            onPressed: () => showModalBottomSheet<void>(context: context, builder: (builder) => const ThemeChooser()),
          )),
          Center(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: profile(context)),
          ),
        ],
      );
}
