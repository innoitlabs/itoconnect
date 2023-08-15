import 'package:i2connect/model/dashboard/dashboard/dashboard_model.dart';

class AppConstants {
  static const String appName = '12connect';
  static const String appVersion = '1.0';
  static const String baseUrl = 'https://test-api.itoconnect.online/';
  static const String signIn = 'signin/';
  static const String signup = 'signup/';
  static const String verifyotp = 'verifyotp/';
  static const String forgotPassword = 'forgotpassword/?data=';
  static const String votersCount = 'dashboard/voter_count/';
  static const String caste = 'dashboard/caste/';
  static const String favour = 'dashboard/favour/';
  static const String importantPeople = 'dashboard/imp/';
  static const String statesAndRoles = 'dropdown/';
  static const String districts = 'dropdown/?state_id=';
  static const String dropdowndb = 'dashboard/dropdowndb/';

  static const String userId = 'userId';
  static const String name = 'name';

  static const String registrationUri = '/api/v1/auth/register';
  static const String loginUri = '/api/v1/auth/login';

  static const String configUri = '/api/v1/config';

  static const String forgetPasswordUri = '/api/v1/auth/forgot-password';

  static const String checkPhoneUri = '/api/v1/auth/check-phone';
  static const String resendPhoneOtpUri = '/api/v1/auth/resend-otp-check-phone';
  static const String verifyPhoneUri = '/api/v1/auth/verify-phone';
  static const String socialLoginUri = '/api/v1/auth/social-login';
  static const String checkEmailUri = '/api/v1/auth/check-email';
  static const String resendEmailOtpUri = '/api/v1/auth/resend-otp-check-email';
  static const String verifyEmailUri = '/api/v1/auth/verify-email';
  static const String resetPasswordUri = '/api/v1/auth/reset-password';
  static const String verifyOtpUri = '/api/v1/auth/verify-otp';

  // sharePreference
  static const String token = 'token';
  static const String user = 'user';
  static const String userEmail = 'user_email';
  static const String userPassword = 'user_password';
  static const String homeAddress = 'home_address';
  static const String searchAddress = 'search_address';
  static const String officeAddress = 'office_address';
  static const String cartList = 'cart_list';
  static const String config = 'config';
  static const String guestMode = 'guest_mode';
  static const String currency = 'currency';
  static const String langKey = 'lang';
  static const String intro = 'intro';

  // order status
  static const String pending = 'pending';
  static const String confirmed = 'confirmed';
  static const String processing = 'processing';
  static const String processed = 'processed';
  static const String delivered = 'delivered';
  static const String failed = 'failed';
  static const String returned = 'returned';
  static const String cancelled = 'canceled';
  static const String outForDelivery = 'out_for_delivery';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String theme = 'theme';
  static const String topic = 'i2connect';
  static const String userAddress = 'user_address';
}

String getConstituencyTitle(List<DropdownConstituencyModel> constituencies) {
  if (constituencies.isNotEmpty) {
    return '${constituencies.first.mla_constituency_name} ${constituencies.length > 1 ? ' + ${constituencies.length - 1}' : ''}';
  } else {
    return 'Select Consituencies';
  }
}

String getMandalTitle(List<MandalModel> mandalList) {
  if (mandalList.isNotEmpty) {
    return '${mandalList.first.mandal_name} ${mandalList.length > 1 ? ' + ${mandalList.length - 1}' : ''}';
  } else {
    return 'Select Mandal';
  }
}

String getVillageTitle(List<VillageModal> villages) {
  if (villages.isNotEmpty) {
    return '${villages.first.ward_village_name} ${villages.length > 1 ? ' + ${villages.length - 1}' : ''}';
  } else {
    return 'Select Village';
  }
}

String getPollingTitle(List<PollingModel> pollingList) {
  if (pollingList.isNotEmpty) {
    return '${pollingList.first.polling_booth_name} ${pollingList.length > 1 ? ' + ${pollingList.length - 1}' : ''}';
  } else {
    return 'Select Polling';
  }
}
