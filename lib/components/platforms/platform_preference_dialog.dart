import 'package:application/components/platforms/platform_component.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PlatformPreferenceResult {
  PlatformPreferenceResult({
    required this.orderedPlatforms,
    required this.remember,
  });
  final List<PlatformDto> orderedPlatforms;
  final bool remember;
}

class PlatformPreferenceDialog extends StatefulWidget {
  const PlatformPreferenceDialog({
    required this.platforms,
    this.initialRemember = false,
    this.isForSettings = false,
    super.key,
  });

  final List<PlatformDto> platforms;
  final bool initialRemember;
  final bool isForSettings;

  static Future<PlatformPreferenceResult?> show(
    final BuildContext context, {
    required final List<PlatformDto> platforms,
    final bool initialRemember = false,
    final bool isForSettings = false,
  }) => showModalBottomSheet<PlatformPreferenceResult>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (final BuildContext context) => FractionallySizedBox(
      heightFactor: 0.45,
      child: PlatformPreferenceDialog(
        platforms: platforms,
        initialRemember: initialRemember,
        isForSettings: isForSettings,
      ),
    ),
  );

  @override
  State<PlatformPreferenceDialog> createState() =>
      _PlatformPreferenceDialogState();
}

class _PlatformPreferenceDialogState extends State<PlatformPreferenceDialog> {
  late List<PlatformDto> _platforms;
  late bool _remember;

  @override
  void initState() {
    super.initState();
    _platforms = List<PlatformDto>.from(widget.platforms);
    _remember = widget.initialRemember;
  }

  @override
  Widget build(final BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                l10n.platformPreferencesDescription,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.dragToReorder,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ReorderableListView.builder(
                  itemBuilder: (final BuildContext context, final int index) {
                    final PlatformDto platform = _platforms[index];

                    return Padding(
                      key: ValueKey<String>(platform.id),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Flex(
                        direction: Axis.horizontal,
                        spacing: 8,
                        children: <Widget>[
                          PlatformComponent(
                            platform: platform,
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            platform.name,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          const Icon(Icons.drag_indicator),
                        ],
                      ),
                    );
                  },
                  itemCount: _platforms.length,
                  onReorder: (final int oldIndex, int newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final PlatformDto item = _platforms.removeAt(oldIndex);
                      _platforms.insert(newIndex, item);
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Row(
                children: <Widget>[
                  if (!widget.isForSettings)
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _remember = !_remember),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: _remember,
                              onChanged: (final bool? value) =>
                                  setState(() => _remember = value ?? false),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(l10n.rememberMyChoice)),
                          ],
                        ),
                      ),
                    )
                  else
                    const Spacer(),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pop<PlatformPreferenceResult>(
                          PlatformPreferenceResult(
                            orderedPlatforms: _platforms,
                            remember: widget.isForSettings || _remember,
                          ),
                        ),
                    child: Text(
                      widget.isForSettings ? l10n.save : l10n.continueLabel,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
