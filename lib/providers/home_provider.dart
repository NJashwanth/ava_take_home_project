import 'package:ava_take_home_project/models/home_model.dart';
import 'package:ava_take_home_project/view_models/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, AsyncValue<HomeModel>>(
        (ref) => HomeViewModel(ref),);
