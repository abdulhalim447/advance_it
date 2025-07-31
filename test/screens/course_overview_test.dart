import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:advance_it_ltd/screens/smart_earning_projects/course_overview.dart';

void main() {
  group('CourseOverviewScreen Tests', () {
    testWidgets('should display course overview screen with all sections', (
      WidgetTester tester,
    ) async {
      // Build the widget
      await tester.pumpWidget(MaterialApp(home: const CourseOverviewScreen()));

      // Verify that the main title is displayed
      expect(find.text('স্মার্ট আর্নিং বিজনেস'), findsOneWidget);
      expect(find.text('কোর্স'), findsOneWidget);

      // Verify that the description section is present
      expect(
        find.textContaining('স্মার্ট আর্নিং কোর্স শুধু একটি আয়ের উৎস নয়'),
        findsOneWidget,
      );

      // Verify that the enrollment button is present
      expect(find.text('কোর্সে ভর্তি হন'), findsOneWidget);

      // Verify that benefit items are displayed
      expect(find.text('বেসিক ভিডিও এডিটিং'), findsOneWidget);
      expect(find.text('AI টুলের ব্যবহার'), findsOneWidget);
    });

    testWidgets('should show enrollment dialog when button is tapped', (
      WidgetTester tester,
    ) async {
      // Build the widget
      await tester.pumpWidget(MaterialApp(home: const CourseOverviewScreen()));

      // Scroll to make the button visible
      await tester.scrollUntilVisible(find.text('কোর্সে ভর্তি হন'), 500.0);

      // Find and tap the enrollment button
      await tester.tap(find.text('কোর্সে ভর্তি হন'));
      await tester.pumpAndSettle();

      // Verify that the dialog is shown
      expect(find.text('কোর্সে ভর্তি'), findsOneWidget);
      expect(
        find.text('আপনি কি স্মার্ট আর্নিং বিজনেস কোর্সে ভর্তি হতে চান?'),
        findsOneWidget,
      );
      expect(find.text('বাতিল'), findsOneWidget);
      expect(find.text('ভর্তি হন'), findsWidgets);
    });

    testWidgets('should close dialog when cancel is tapped', (
      WidgetTester tester,
    ) async {
      // Build the widget
      await tester.pumpWidget(MaterialApp(home: const CourseOverviewScreen()));

      // Scroll to make the button visible
      await tester.scrollUntilVisible(find.text('কোর্সে ভর্তি হন'), 500.0);

      // Open the dialog
      await tester.tap(find.text('কোর্সে ভর্তি হন'));
      await tester.pumpAndSettle();

      // Tap cancel button
      await tester.tap(find.text('বাতিল'));
      await tester.pumpAndSettle();

      // Verify that the dialog is closed
      expect(find.text('কোর্সে ভর্তি'), findsNothing);
    });

    testWidgets('should show snackbar when enrollment is confirmed', (
      WidgetTester tester,
    ) async {
      // Build the widget
      await tester.pumpWidget(MaterialApp(home: const CourseOverviewScreen()));

      // Scroll to make the button visible
      await tester.scrollUntilVisible(find.text('কোর্সে ভর্তি হন'), 500.0);

      // Open the dialog
      await tester.tap(find.text('কোর্সে ভর্তি হন'));
      await tester.pumpAndSettle();

      // Tap enrollment confirmation button in dialog
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify that the snackbar is shown
      expect(find.text('কোর্সে ভর্তির জন্য ধন্যবাদ!'), findsOneWidget);
    });
  });
}
