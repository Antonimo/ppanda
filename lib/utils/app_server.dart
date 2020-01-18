class AppServer {
//  static const serverAddress = 'http://192.168.1.122:8009/';
  static const serverAddress = 'https://app.arrow23.net/';

  static const apiBase = serverAddress + 'api/';

  static const String postRegisterUser = apiBase + 'user/register';
  static const String getUserData = apiBase + 'user/auth/data';
  static const String putUpdateProfile = apiBase + 'user/';
  static const String postConnectCamera = apiBase + 'camera/link';
  static const String getPoolBoundaries = apiBase + 'home-account/{homeAccountId}/pool/image';

  static const String postUpdatePool = apiBase + 'home-account/{homeAccountId}/pool';

  static const String postCreateInvitation = apiBase + 'home-account/{homeAccountId}/invitation';
  static const String getInvitations = apiBase + 'home-account/{homeAccountId}/invitation';
  static const String getPeople = apiBase + 'home-account/{homeAccountId}/people';

  static const String postUpdateContact = apiBase + 'home-account/{homeAccountId}/invitation/{invitationId}';
  static const String postRemovePerson = apiBase + 'home-account/{homeAccountId}/invitation/{invitationId}';

  static const String putUpdateAccount = apiBase + 'home-account/{homeAccountId}/user';
  static const String postUpdateCamera = apiBase + 'camera/home-account/{homeAccountId}/camera/{cameraId}/update-name';
  static const String putUnlinkCamera = apiBase + 'camera/home-account/{homeAccountId}/camera/{cameraId}';

  static const String postUpdatePreferences = apiBase + 'home-account/{homeAccountId}/update-preferences';

  static const String getGenerateProfileImageUploadUrl = apiBase + 'user/profile/upload-profile-image-url';


  /// Timeline
  static const String getNotifications = apiBase + 'home-account/{homeAccountId}/notification-record'; // ?start=2019-09-08 21:00:00.000Z&end=2020-09-09T18:00:00.000Z
  static const String getRecords = apiBase + 'home-account/{homeAccountId}/record'; // ?start=2019-09-08 21:00:00.000Z&end=2020-09-09T18:00:00.000Z

  /// Event Detail
  static const String getRecordDetail = apiBase + 'home-account/{homeAccountId}/record/{id}';


  // Not tested
  static const String playbackRecord = apiBase + 'playback/549d0337-a68b-449c-9da5-677bfe45e02a/record';
  static const String postScoutingSystemState = apiBase + 'scouting_system_state';

  // ???
  static const String postInvitePerson = apiBase + 'contacts/invite';
  static const String postUpdatePerson = apiBase + 'contacts/update';
  static const String account = apiBase + 'account';
}
