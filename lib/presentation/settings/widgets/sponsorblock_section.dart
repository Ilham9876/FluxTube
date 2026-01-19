import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/settings/settings_bloc.dart';
import 'package:fluxtube/core/colors.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/generated/l10n.dart';

class SponsorBlockSettingsSection extends StatelessWidget {
  const SponsorBlockSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.isSponsorBlockEnabled != current.isSponsorBlockEnabled ||
          previous.sponsorBlockCategories != current.sponsorBlockCategories,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locals.sponsorBlock,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16),
            ),
            kHeightBox10,
            ListTile(
              title: Text(locals.sponsorBlock,
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(locals.sponsorBlockDescription),
              leading: const Icon(Icons.skip_next),
              trailing: Switch(
                value: state.isSponsorBlockEnabled,
                onChanged: (_) {
                  BlocProvider.of<SettingsBloc>(context)
                      .add(SettingsEvent.toggleSponsorBlock());
                },
              ),
            ),
            if (state.isSponsorBlockEnabled) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locals.sponsorBlockCategories,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    kHeightBox10,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildCategoryChip(context, state, 'sponsor', locals.sponsor, isDarkMode),
                        _buildCategoryChip(context, state, 'intro', locals.intro, isDarkMode),
                        _buildCategoryChip(context, state, 'outro', locals.outro, isDarkMode),
                        _buildCategoryChip(context, state, 'selfpromo', locals.selfPromotion, isDarkMode),
                        _buildCategoryChip(context, state, 'interaction', locals.interaction, isDarkMode),
                        _buildCategoryChip(context, state, 'music_offtopic', locals.musicOfftopic, isDarkMode),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildCategoryChip(
      BuildContext context, SettingsState state, String category, String label, bool isDarkMode) {
    final isSelected = state.sponsorBlockCategories.contains(category);

    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? kWhiteColor
              : (isDarkMode ? kWhiteColor.withValues(alpha: 0.8) : kBlackColor),
          fontSize: 13,
        ),
      ),
      selected: isSelected,
      onSelected: (_) {
        final categories = List<String>.from(state.sponsorBlockCategories);
        if (isSelected) {
          categories.remove(category);
        } else {
          categories.add(category);
        }
        BlocProvider.of<SettingsBloc>(context)
            .add(SettingsEvent.setSponsorBlockCategories(categories: categories));
      },
      backgroundColor: isDarkMode
          ? kWhiteColor.withValues(alpha: 0.1)
          : kGreyOpacityColor,
      selectedColor: kRedColor,
      checkmarkColor: kWhiteColor,
      side: BorderSide(
        color: isSelected
            ? kRedColor
            : (isDarkMode ? kWhiteColor.withValues(alpha: 0.3) : kGreyColor!.withValues(alpha: 0.3)),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      showCheckmark: true,
      visualDensity: VisualDensity.compact,
    );
  }
}
