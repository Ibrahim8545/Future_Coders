const String imagePath = "assets/images";
const String iconsPath = "assets/icons";

abstract class ImageAssets{
  static const String curveImage ="$imagePath/curve.png";

}

abstract class IconsAssets{
  static const String _arrowBack = "$iconsPath/arrowBack.png";
  static const String _editProfile = "$iconsPath/editProfile.png";
  static const String _favorite = "$iconsPath/favorite.png";
  static const String _helpIcon = "$iconsPath/helpIcon.png";
  static const String _icCommunity = "$iconsPath/icCommunity.png";
  static const String _icCourses = "$iconsPath/icCourses.png";
  static const String _icFathers = "$iconsPath/icFathers.png";
  static const String _icHome = "$iconsPath/icHome.png";
  static const String _icProfile = "$iconsPath/icProfile.png";
  static const String _logout = "$iconsPath/logout.png";
  static const String _payIcon = "$iconsPath/payIcon.png";
  static const String _settingIcon = "$iconsPath/settingIcon.png";

  static String get arrowBack => _arrowBack;
  static String get editProfile => _editProfile;
  static String get favorite => _favorite;
  static String get helpIcon => _helpIcon;
  static String get icCommunity => _icCommunity;
  static String get icCourses => _icCourses;
  static String get icFathers => _icFathers;
  static String get icHome => _icHome;
  static String get icProfile => _icProfile;
  static String get logout => _logout;
  static String get payIcon => _payIcon;
  static String get settingIcon => _settingIcon;
}