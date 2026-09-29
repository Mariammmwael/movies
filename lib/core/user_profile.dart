import 'package:flutter/foundation.dart';
import 'package:movieapp/core/theme/app_assets.dart';

class UserProfile {
  static final ValueNotifier<String> name = ValueNotifier<String>('John Safwat');
  static final ValueNotifier<String> phone = ValueNotifier<String>('01200000000');
  static final ValueNotifier<String> avatar = ValueNotifier<String>(AppAssets.avatar1);

  static void updateProfile({
    required String newName,
    required String newPhone,
    required String newAvatar,
  }) {
    name.value = newName;
    phone.value = newPhone;
    avatar.value = newAvatar;
  }
}
