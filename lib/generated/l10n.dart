// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Kegel Exercises`
  String get title {
    return Intl.message(
      'Kegel Exercises',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Plan`
  String get plan {
    return Intl.message(
      'Plan',
      name: 'plan',
      desc: '',
      args: [],
    );
  }

  /// `PLANS`
  String get plans {
    return Intl.message(
      'PLANS',
      name: 'plans',
      desc: '',
      args: [],
    );
  }

  /// `Weekly`
  String get weekly {
    return Intl.message(
      'Weekly',
      name: 'weekly',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get Monthly {
    return Intl.message(
      'Monthly',
      name: 'Monthly',
      desc: '',
      args: [],
    );
  }

  /// `6`
  String get six {
    return Intl.message(
      '6',
      name: 'six',
      desc: '',
      args: [],
    );
  }

  /// `Months`
  String get months {
    return Intl.message(
      'Months',
      name: 'months',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Rate Us`
  String get rateUs {
    return Intl.message(
      'Rate Us',
      name: 'rateUs',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Give Us Feedback`
  String get feedback {
    return Intl.message(
      'Give Us Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Reset Progress`
  String get resetProgress {
    return Intl.message(
      'Reset Progress',
      name: 'resetProgress',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get userID {
    return Intl.message(
      'User ID',
      name: 'userID',
      desc: '',
      args: [],
    );
  }

  /// `Save 75%`
  String get save {
    return Intl.message(
      'Save 75%',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `version v0.0.1`
  String get version {
    return Intl.message(
      'version v0.0.1',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `all exercises`
  String get allExercises {
    return Intl.message(
      'all exercises',
      name: 'allExercises',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Current Goal`
  String get currentGoal {
    return Intl.message(
      'Current Goal',
      name: 'currentGoal',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Complete 2 sessions to\n finish training day`
  String get completeDesc {
    return Intl.message(
      'Complete 2 sessions to\n finish training day',
      name: 'completeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Start The Workout Session`
  String get startWorkoutSession {
    return Intl.message(
      'Start The Workout Session',
      name: 'startWorkoutSession',
      desc: '',
      args: [],
    );
  }

  /// `my workout`
  String get myWorkout {
    return Intl.message(
      'my workout',
      name: 'myWorkout',
      desc: '',
      args: [],
    );
  }

  /// `session`
  String get session {
    return Intl.message(
      'session',
      name: 'session',
      desc: '',
      args: [],
    );
  }

  /// `optional session`
  String get optionalSession {
    return Intl.message(
      'optional session',
      name: 'optionalSession',
      desc: '',
      args: [],
    );
  }

  /// `Before You Start`
  String get beforeYouStart {
    return Intl.message(
      'Before You Start',
      name: 'beforeYouStart',
      desc: '',
      args: [],
    );
  }

  /// `First of all, let's repeat how to find the pelvic floor (PF) muscles. These are the muscles that need to be engaged during your workout. Are you Ready?`
  String get beforeYouStartDesc {
    return Intl.message(
      'First of all, let\'s repeat how to find the pelvic floor (PF) muscles. These are the muscles that need to be engaged during your workout. Are you Ready?',
      name: 'beforeYouStartDesc',
      desc: '',
      args: [],
    );
  }

  /// `Read the info above carefully`
  String get readTheInfoAbove {
    return Intl.message(
      'Read the info above carefully',
      name: 'readTheInfoAbove',
      desc: '',
      args: [],
    );
  }

  /// `Let's do this!`
  String get letsDoThis {
    return Intl.message(
      'Let\'s do this!',
      name: 'letsDoThis',
      desc: '',
      args: [],
    );
  }

  /// `Did you managed to find the PF muscles?`
  String get didYouManaged {
    return Intl.message(
      'Did you managed to find the PF muscles?',
      name: 'didYouManaged',
      desc: '',
      args: [],
    );
  }

  /// `Yes, I did`
  String get yesIDid {
    return Intl.message(
      'Yes, I did',
      name: 'yesIDid',
      desc: '',
      args: [],
    );
  }

  /// `No,I don't get it`
  String get noIDont {
    return Intl.message(
      'No,I don\'t get it',
      name: 'noIDont',
      desc: '',
      args: [],
    );
  }

  /// `Try the Exercise`
  String get tryTheExercise {
    return Intl.message(
      'Try the Exercise',
      name: 'tryTheExercise',
      desc: '',
      args: [],
    );
  }

  /// `You've learned what PF muscles are, how to find and use them. So, it's the right time to do 2 simple exercises from the Main Training Program. Are you ready?`
  String get tryExerciseDesc {
    return Intl.message(
      'You\'ve learned what PF muscles are, how to find and use them. So, it\'s the right time to do 2 simple exercises from the Main Training Program. Are you ready?',
      name: 'tryExerciseDesc',
      desc: '',
      args: [],
    );
  }

  /// `Prepare for`
  String get prepareFor {
    return Intl.message(
      'Prepare for',
      name: 'prepareFor',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get FAQ {
    return Intl.message(
      'FAQ',
      name: 'FAQ',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get Finish {
    return Intl.message(
      'Finish',
      name: 'Finish',
      desc: '',
      args: [],
    );
  }

  /// `Not Now`
  String get notNow {
    return Intl.message(
      'Not Now',
      name: 'notNow',
      desc: '',
      args: [],
    );
  }

  /// `Enjoying Kegel Exercises`
  String get enjoyingApp {
    return Intl.message(
      'Enjoying Kegel Exercises',
      name: 'enjoyingApp',
      desc: '',
      args: [],
    );
  }

  /// `Tap a star to rate it on the app store.`
  String get ratingDesc {
    return Intl.message(
      'Tap a star to rate it on the app store.',
      name: 'ratingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Good Job!`
  String get goodJob {
    return Intl.message(
      'Good Job!',
      name: 'goodJob',
      desc: '',
      args: [],
    );
  }

  /// `Complete at least one more round in a few hours to complete your training day. `
  String get reminderMessage {
    return Intl.message(
      'Complete at least one more round in a few hours to complete your training day. ',
      name: 'reminderMessage',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Here you can refine exercises technique`
  String get hereYouCanRefineExercisesTechnique {
    return Intl.message(
      'Here you can refine exercises technique',
      name: 'hereYouCanRefineExercisesTechnique',
      desc: '',
      args: [],
    );
  }

  /// `All Exercises`
  String get CapitalAllExercises {
    return Intl.message(
      'All Exercises',
      name: 'CapitalAllExercises',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message(
      'Available',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get stop {
    return Intl.message(
      'Stop',
      name: 'stop',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Try`
  String get tryText {
    return Intl.message(
      'Try',
      name: 'tryText',
      desc: '',
      args: [],
    );
  }

  /// `How to find the right muscle`
  String get howToFindTheRightMuscle {
    return Intl.message(
      'How to find the right muscle',
      name: 'howToFindTheRightMuscle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
