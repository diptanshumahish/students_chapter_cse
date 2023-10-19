import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabNotifier extends StateNotifier<int> {
  TabNotifier(state) : super(state) {
    _loadTabSelected();
  }

  //only required function
  void updateTab(int tabNo) {
    state = tabNo;
    _saveTabSelectedData();
  }

  static const _tabKey = "selected_tab";
  Future<void> _loadTabSelected() async {
    final prefs = await SharedPreferences.getInstance();
    final tabSelected = prefs.getString(_tabKey);
    if (tabSelected != null) {
      state = int.parse(tabSelected);
    }
  }

  Future<void> _saveTabSelectedData() async {
    final prefs = await SharedPreferences.getInstance();
    final tabSelectedData = state.toString();
    prefs.setString(_tabKey, tabSelectedData);
  }
}

final tabProvider =
    StateNotifierProvider<TabNotifier, int>((ref) => TabNotifier(0));
