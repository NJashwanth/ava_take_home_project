import 'package:ava_take_home_project/models/settings_model.dart';
import 'package:ava_take_home_project/view_models/settings_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsViewModeModelProvider =
    StateNotifierProvider<SettingsViewModel, AsyncValue<SettingsModel>>(
  (ref) => SettingsViewModel(isEditMode: false, ref: ref),
);
final settingsEditModeModelProvider =
    StateNotifierProvider<SettingsViewModel, AsyncValue<SettingsModel>>(
  (ref) => SettingsViewModel(isEditMode: true, ref: ref),
);
