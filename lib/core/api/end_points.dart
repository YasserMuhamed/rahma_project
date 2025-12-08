class EndPoints {
  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
  static const String logout = '/api/auth/logout';
  static const String sendOTPCode = '/api/auth/phone/send';
  static const String checkOTPCode = '/api/auth/phone/check';
  static const String forgotPassword = '/api/auth/forgot-password';
  static const String resetPassword = '/api/auth/reset-password';
  static const String changePassword = '/api/auth/change-password';
  static final String loginStudent = "/login_student";
  static final String logoutStudent = "/api/auth/logout";
  static final String refreshToken = "/api/auth/refresh";
  static final String signupStudent = "/signup_student";
  static final String currentUser = "/api/auth/me";
  static final String studentRegister = "/api/auth/student-register";

  static String liveSessions(String scope) => "/api/live/sessions?scope=$scope";
  static String startQuiz(int lessonId) => "/api/quizzes/$lessonId/start";
  static String submitQuiz(int quizId) => "/api/quizzes/$quizId/submit";
  static final String subjectsOverview = "/api/profile/subjects";
  static final String availableSubjects = "/api/subjects/available";
  static final String allSubjects = "/api/learning/subjects/browse";
  static final String continueLearning = "/api/dashboard/continue-learning";

  static String plans = "/api/plans";
  static String subscription = "/api/subscriptions";
  static String pendingSubscription = "/api/subscriptions/pending";
  static String paymentInitiate = "/api/payments/initiate";
  static String enrollToSubject(int subjectId) =>
      "/api/subjects/$subjectId/enroll";
  static String unEnrollFromSubject(int subjectId) =>
      "/api/subjects/$subjectId/unenroll";
  static String cancelSubscription(int subscriptionId) =>
      "/api/subscriptions/$subscriptionId/cancel";

  static final String educationSystems = "/api/auth/education-systems";
  static final String cities = "/api/auth/cities";
  static final String userProfile = "/api/users/profile";
  static final String uploadAvatar = "/api/users/avatar/upload";
  static final String userInfo = "/api/users/dashboard/user-info";
  static final String deactivateAccount = "/api/users/account/deactivate";
  static final String exportedData = "/api/users/data/export";
  static final String preferences = "/api/users/preferences";

  static String reviewRegistration(int userId) =>
      "/api/auth/registration-review/$userId";
  static String confirmRegistration(int userId) =>
      "/api/auth/registration-confirm/$userId";
  static const String verifyPhone = '/api/auth/phone-verify';
  static const String addEmail = '/api/auth/add-email';
  static const String sendEmailLink = '/api/auth/email/send-link';
  static String verifyEmail(String verificationToken) =>
      '/api/auth/email/verify?token=$verificationToken';
  static String subjectsChapters(int subjectId) =>
      "/api/subjects/$subjectId/chapters";
  static String chaptersLessons(int chapterId) =>
      "/api/chapters/$chapterId/lessons";
  static String lesson(int chapterId, int lessonId) =>
      "/api/chapters/$chapterId/lessons/$lessonId";
  static String lessonProgress(int lessonId) =>
      "/api/lessons/$lessonId/progress";
  static String nextLesson(int lessonId) =>
      "/api/learning/lessons/$lessonId/next";
  static String chatThreads({required int page, String? searchQuery}) =>
      "/api/chat/threads?page=$page&per_page=20&search=${searchQuery ?? ''}";
  static String chatMessages({
    required int threadId,
    required int page,
    required int perPage,
  }) => "/api/chat/threads/$threadId/messages?page=$page&per_page=$perPage";
  static String chatSend({required int threadId}) =>
      "/api/chat/threads/$threadId/messages";
  static const String uploadFile = "/api/chat/messages/upload";
  static String requestSignedUrl({required int threadId}) =>
      "/api/chat/threads/$threadId/messages";
  static String accessLinkWithGCSFileName({required String gcsFileName}) =>
      "/api/chat/files/$gcsFileName/access";
  static String downloadLinkWithGCSFileName({required String gcsFileName}) =>
      "/api/chat/files/$gcsFileName/access?download=true";

  static String availableTeachers = "/api/chat/contacts/teachers";
  static String availableAdmins = "/api/chat/contacts/admins";
  static String myTeachers = "/api/chat/contacts/my-teachers";
  static String searchContacts({String? query, String? type}) =>
      "/api/chat/contacts/search?query=$query&type=$type";
  static String createThread = "/api/chat/threads";
}

class ApiKeys {}
