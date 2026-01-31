import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Screens/Update_event/Update_Event.dart';
import 'package:to_do/providers/favoraite_tab_provider.dart';
import 'package:to_do/providers/theme_provider.dart';

class FavoriteTab extends StatelessWidget {
  String _getImageForCategory(String category) {
    final map = {
      'category_birthday': 'Birthday',
      'category_book_club': 'Book_club',
      'category_exhibition': 'Exhibition',
      'category_gaming': 'Gamming',
      'category_holiday': 'Holiday',
      'category_meeting': 'Meeting',
      'category_sport': 'Sport',
      'category_workshop': 'Workshop',
    };

    return 'assets/images/${map[category] ?? 'default'}.png';
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd MMM');
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => FavoraiteTabProvider()..getFavorite(),
      builder: (context, child) {
        final provider = Provider.of<FavoraiteTabProvider>(context);

        // theme tokens
        final colorScheme = Theme.of(context).colorScheme;
        final scaffoldBg = Theme.of(context).scaffoldBackgroundColor;
        final surface = colorScheme.surface;
        final onSurface = colorScheme.onSurface;
        final primary = colorScheme.primary;
        final error = colorScheme.error;
        final onError = colorScheme.onError;
        final iconColor = Theme.of(context).iconTheme.color;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: scaffoldBg,
            title: ListTile(
              title: Text(
                "welcome_back".tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text(
                provider.currentUser?.name ?? "",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  themeProvider.toggleTheme();
                },
                icon: Icon(
                  themeProvider.themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                  color: iconColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () {
                    if (context.locale == const Locale('en', 'US')) {
                      context.setLocale(const Locale('ar', 'EG'));
                    } else {
                      context.setLocale(const Locale('en', 'US'));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primary,
                    ),
                    height: 32,
                    width: 34,
                    child: Center(
                      child: Text(
                        context.locale.languageCode.toUpperCase(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: scaffoldBg,
          body: provider.fav.isEmpty
              ? Center(child: Text("no_events".tr(), style: Theme.of(context).textTheme.bodyMedium))
              : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                final event = provider.fav[index];

                return Slidable(
                  key: ValueKey(event.id),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UpdateEvent(event: event)),
                          );
                        },
                        backgroundColor: surface,
                        foregroundColor: primary,
                        icon: Icons.edit,
                        label: 'edit'.tr(),
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          provider.deleteEvent(event);
                        },
                        backgroundColor: error,
                        foregroundColor: onError,
                        icon: Icons.delete,
                        label: 'delete'.tr(),
                      ),
                    ],
                  ),
                  startActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UpdateEvent(event: event)),
                          );
                        },
                        backgroundColor: surface,
                        foregroundColor: primary,
                        icon: Icons.edit,
                        label: 'edit'.tr(),
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          provider.deleteEvent(event);
                        },
                        backgroundColor: error,
                        foregroundColor: onError,
                        icon: Icons.delete,
                        label: 'delete'.tr(),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 193,
                    color: scaffoldBg,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            _getImageForCategory(event.category),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Top date badge
                        Positioned(
                          left: 8,
                          top: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                            decoration: BoxDecoration(
                              color: surface.withOpacity(0.90),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              formatter.format(DateTime.fromMillisecondsSinceEpoch(event.date)),
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: onSurface),
                            ),
                          ),
                        ),

                        // Bottom info band
                        Positioned(
                          left: 8,
                          right: 8,
                          bottom: 8,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: surface.withOpacity(0.92),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    event.titel,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: onSurface),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    event.isFavorite = !event.isFavorite;
                                    provider.updateEvent(event);
                                  },
                                  child: Icon(
                                    event.isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: provider.fav.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            ),
          ),
        );
      },
    );
  }
}