import 'package:application/components/card_component.dart';
import 'package:application/controllers/notifications_controller.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RequestNotificationView extends StatefulWidget {
  const RequestNotificationView({super.key});

  @override
  State<RequestNotificationView> createState() =>
      _RequestNotificationViewState();
}

class _RequestNotificationViewState extends State<RequestNotificationView> {
  NotificationsType _selectedType = NotificationsType.all;

  @override
  Widget build(final BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: const BorderRadius.all(Radius.circular(360)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(32),
                  child: Icon(Icons.notifications_outlined, size: 64),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                AppLocalizations.of(context)!.enableNotifications,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.notificationsDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              const SizedBox(height: 32),
              CustomCard(
                child: Column(
                  children: NotificationsType.values
                      .where(
                        (final NotificationsType type) =>
                            type != NotificationsType.none,
                      )
                      .map(
                        (final NotificationsType type) => ListTile(
                          title: Text(
                            AppLocalizations.of(
                              context,
                            )!.notificationsType(type.name),
                          ),
                          subtitle: Text(
                            AppLocalizations.of(
                              context,
                            )!.notificationsSubtitles(type.name),
                          ),
                          trailing: _selectedType == type
                              ? const Icon(Icons.check)
                              : null,
                          onTap: () => setState(() => _selectedType = type),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 64),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        NotificationsController.instance.tmpNotificationsType =
                            _selectedType;
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.activate,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.later,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.color?.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
