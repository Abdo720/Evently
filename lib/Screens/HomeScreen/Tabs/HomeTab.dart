import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Screens/Update_event/Update_Event.dart';
import 'package:to_do/providers/home_tab_provider.dart';
import 'package:intl/intl.dart';
import 'package:to_do/providers/theme_provider.dart';

class HomeTab extends StatelessWidget {
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
    DateFormat formatter = DateFormat('dd MMM');
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => HomeTabProvider()..getEvents(),
      builder: (context, child) {
        final provider = Provider.of<HomeTabProvider>(context);

        // Theme tokens
        final colorScheme = Theme.of(context).colorScheme;
        final scaffoldBg = Theme.of(context).scaffoldBackgroundColor;
        final primary = colorScheme.primary;
        final surface = colorScheme.surface;
        final error = colorScheme.error;
        final onError = colorScheme.onError;
        final onBackground = colorScheme.onBackground;

        return Scaffold(
          backgroundColor: scaffoldBg,
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
                  color: onBackground,
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
          body: Column(
            children: [
              Container(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final selected = provider.selectedCategoriesIndex == index;
                    return GestureDetector(
                      onTap: () {
                        provider.changeCategories(index);
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        label: Text(
                          provider.categories[index].tr().toUpperCase(),
                          style: TextStyle(
                            color: selected ? surface : primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: selected ? primary : surface,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 12);
                  },
                  itemCount: provider.categories.length,
                ),
              ),
              Expanded(
                child: provider.events.isEmpty
                    ? Center(child: Text("no_events".tr()))
                    : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final event = provider.events[index];

                      return Slidable(
                        key: ValueKey(
                          event.id,
                        ),
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateEvent(event: event),
                                  ),
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
                                  MaterialPageRoute(
                                    builder: (context) => UpdateEvent(event: event),
                                  ),
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: scaffoldBg,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.all(8),
                                    child: Text(
                                      formatter.format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                          event.date,
                                        ),
                                      ),
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.all(8),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: scaffoldBg,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(event.titel, style: Theme.of(context).textTheme.titleMedium),
                                        GestureDetector(
                                          onTap: () {
                                            event.isFavorite = !event.isFavorite;
                                            provider.updateEvent(event);
                                          },
                                          child: event.isFavorite
                                              ? Icon(Icons.favorite, color: primary)
                                              : Icon(Icons.favorite_border, color: primary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: provider.events.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}