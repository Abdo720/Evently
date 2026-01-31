import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Models/event_model.dart';
import 'package:to_do/core/firebaseFunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Addevent();
}

class Addevent extends State<AddEvent> {
  final AddEventKey = GlobalKey<FormState>();
  final titelController = TextEditingController();
  final descController = TextEditingController();
  static String routeName = "AddEvent";
  int selectedCategoriesIndex = 0;
  List<String> categories = [
    "category_birthday",
    "category_book_club",
    "category_exhibition",
    "category_gaming",
    "category_holiday",
    "category_meeting",
    "category_sport",
    "category_workshop",
  ];
  Map<String, String> categoryImages = {
    "category_birthday": "Birthday",
    "category_book_club": "Book Club",
    "category_exhibition": "Exhibition",
    "category_gaming": "Gamming",
    "category_holiday": "Holiday",
    "category_meeting": "Meeting",
    "category_sport": "Sport",
    "category_workshop": "Work Shop",
  };

  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final dividerColor = Theme.of(context).dividerColor;
    final iconColor = Theme.of(context).iconTheme.color;
    final textStyleBodySmall = Theme.of(context).textTheme.bodySmall;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("add_event".tr(), style: Theme.of(context).textTheme.displayMedium),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: dividerColor),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/${categoryImages[categories[selectedCategoriesIndex]]}.png",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final selected = selectedCategoriesIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoriesIndex = index;
                      });
                    },
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      label: Text(
                        categories[index].tr().toUpperCase(),
                        style: TextStyle(
                          color: selected ? colorScheme.onPrimary : colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: selected ? colorScheme.primary : colorScheme.surface,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 12);
                },
                itemCount: categories.length,
              ),
            ),
            const SizedBox(height: 24),
            Text("title".tr(), style: Theme.of(context).textTheme.titleMedium),
            Form(
              key: AddEventKey,
              child: TextFormField(
                controller: titelController,
                cursorColor: colorScheme.primary,
                style: textStyleBodySmall,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                  hintText: "event_title_hint".tr(),
                  hintStyle: textStyleBodySmall,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text("description".tr(), style: Theme.of(context).textTheme.titleMedium),
            Form(
              child: TextFormField(
                controller: descController,
                maxLines: 4,
                cursorColor: colorScheme.primary,
                style: textStyleBodySmall,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                  hintText: "event_description_hint".tr(),
                  hintStyle: textStyleBodySmall,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Image.asset(
                  "assets/images/calendar-add.png",
                  height: 32,
                  width: 32,
                ),
                const SizedBox(width: 10),
                Text("event_date".tr(), style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                InkWell(
                  onTap: () {
                    ChoseDate();
                  },
                  child: Text(
                    selectedDate.toString().substring(0, 10),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            MaterialButton(
              onPressed: () {
                final event = EventModel(
                  userid: FirebaseAuth.instance.currentUser!.uid,
                  titel: titelController.text,
                  desc: descController.text,
                  date: selectedDate.millisecondsSinceEpoch,
                  category: categories[selectedCategoriesIndex],
                );
                Firebasefunctions.createEvent(event);
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              height: 50,
              minWidth: double.infinity,
              color: colorScheme.primary,
              child: Text(
                "add_event_button".tr(),
                style: Theme.of(context).textTheme.displayLarge?.copyWith(color: colorScheme.onPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }

  ChoseDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }
}