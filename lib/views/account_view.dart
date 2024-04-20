import 'package:application/controllers/member_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
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
                      AppLocalizations.of(context)!.anonymousAccount,
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
                              title: Text(AppLocalizations.of(context)!
                                  .anonymousWarningTitle),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                        .anonymousWarningContent1),
                                    const SizedBox(height: 16),
                                    Text(AppLocalizations.of(context)!
                                        .anonymousWarningContent2),
                                    const SizedBox(height: 16),
                                    Text(AppLocalizations.of(context)!
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
                  AppLocalizations.of(context)!.member,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'WORK IN PROGRESS',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(AppLocalizations.of(context)!.cancel),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.createAccount),
                ),
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
                  label: AppLocalizations.of(context)!.animesAdded,
                  value: MemberController.instance.member?.followedAnimes.length
                          .toString() ??
                      '0',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AccountCard(
                  label: AppLocalizations.of(context)!.episodesWatched,
                  value: MemberController
                          .instance.member?.followedEpisodes.length
                          .toString() ??
                      '0',
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
                  label: AppLocalizations.of(context)!.watchTime,
                  value: MemberController.instance.buildTotalDuration(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            AppLocalizations.of(context)!.account,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.identifier),
          subtitle: Text(AppLocalizations.of(context)!.identifierSubtitle),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                MemberController.instance.identifier ??
                    AppLocalizations.of(context)!.noIdentifier,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return EditIdentifier();
                    },
                  );
                },
                child: const Icon(Icons.edit),
              ),
            ],
          ),
          onTap: () {
            if (MemberController.instance.identifier == null) {
              return;
            }

            // Copy to clipboard
            Clipboard.setData(
              ClipboardData(text: MemberController.instance.identifier!),
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context)!.identifierCopied),
                  ],
                ),
              ),
            );

            Vibration.vibrate(duration: 200, amplitude: 255);
          },
        ),
      ],
    );
  }
}

class AccountCard extends StatelessWidget {
  final String label;
  final String value;

  const AccountCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class EditIdentifier extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  EditIdentifier({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.enterNewIdentifier,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.identifier,
            ),
            controller: _controller,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            saveIdentifier(context);
          },
          child: Text(AppLocalizations.of(context)!.save),
        ),
      ],
    );
  }

  Future<void> saveIdentifier(BuildContext context) async {
    if (_controller.text.isEmpty) {
      Vibration.vibrate(duration: 200, amplitude: 255);
      return;
    }

    final oldIdentifier = MemberController.instance.identifier;

    try {
      await MemberController.instance.testLogin(_controller.text);
      await MemberController.instance.login(identifier: _controller.text);
    } catch (e) {
      Vibration.vibrate(duration: 200, amplitude: 255);

      if (MemberController.instance.identifier != oldIdentifier) {
        await MemberController.instance.login(identifier: oldIdentifier);
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.invalidIdentifier,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    } finally {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}
