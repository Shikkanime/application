import 'package:application/components/accounts/account_card.dart';
import 'package:application/components/accounts/associate_email.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return StreamBuilder<MemberDto>(
      stream: MemberController.instance.streamController.stream,
      initialData: MemberController.instance.member,
      builder: (context, snapshot) {
        final member = snapshot.data;

        return ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${Constant.apiUrl}/v1/attachments?uuid=${member?.uuid}&v=${MemberController.instance.imageVersion}',
                            filterQuality: FilterQuality.high,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => DecoratedBox(
                              decoration:
                                  BoxDecoration(color: Colors.grey[900]),
                              child: const Icon(
                                Icons.person,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            MemberController.instance.changeImage();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.edit,
                                size: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          appLocalizations!.anonymousAccount,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          child: const Icon(
                            Icons.info,
                            color: Colors.grey,
                            size: 20,
                          ),
                          onTap: () {
                            showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    appLocalizations.anonymousWarningTitle,
                                  ),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(appLocalizations
                                            .anonymousWarningContent1),
                                        const SizedBox(height: 16),
                                        Text(appLocalizations
                                            .anonymousWarningContent2),
                                        const SizedBox(height: 16),
                                        Text(appLocalizations
                                            .anonymousWarningContent3),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Text(
                      appLocalizations.member,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    if (member?.email == null) ...[
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AssociateEmail(),
                            ),
                          );
                        },
                        child: Text(appLocalizations.associateEmail),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: AccountCard(
                      label: appLocalizations.animesAdded,
                      value: member?.followedAnimes.length.toString() ?? '0',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AccountCard(
                      label: appLocalizations.episodesWatched,
                      value: member?.followedEpisodes.length.toString() ?? '0',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: AccountCard(
                      label: appLocalizations.watchTime,
                      value: MemberController.instance.buildTotalDuration(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Nos recommandations',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            const ListTile(
              title: Text('Bah non, toujours pas de recommandations.'),
              subtitle:
                  Text("Mais ça va venir, promis ! (Peut-être d'ici 2027)"),
            ),
          ],
        );
      },
    );
  }
}
