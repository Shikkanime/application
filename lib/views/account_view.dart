import 'package:application/components/accounts/account_card.dart';
import 'package:application/components/accounts/associate_email.dart';
import 'package:application/components/member_image.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

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
                        child: MemberImage(member: member),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            MemberController.instance.changeImage(context);
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
            const SizedBox(height: 32),
            Text(
              appLocalizations.accountCreatedAt(
                beautifyDate(context, member?.creationDateTime ?? ''),
              ),
              style: const TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }

  String beautifyDate(BuildContext context, String date) {
    return DateFormat(
      "EEEE dd MMM yyyy",
      Localizations.localeOf(context).languageCode,
    ).format(DateTime.parse(date));
  }
}
