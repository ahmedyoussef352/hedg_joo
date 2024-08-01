// ignore_for_file: static constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const hedgScreenPadding =
      EdgeInsets.only(top: 20, left: 16, right: 16);
  static const String ERROR = "error";
  static const String UNKNOWN_ERROR = "unknowError";
  static const String UNSUPPORTED_IOS_DEVICE = "unsupported_ios_device";
  static const String CANCEL = "cancel";
  static const String OKAY = "okay";

  ///[APP Constant]
  static const String APP_NAME = "Hedg";
  static const int EIGHTEEN_YEARS_IN_DAYS = 18 * 365;
  static const int INITIAL_YEAR = 1940;
  static const int END_YEAR_IN_DAYS = 365 * 2;
  static const double MAX_IMAGE_SIZE_IN_BYTES = 1024 * 1024 * MAX_IMAGE_IN_MB;
  static const double MAX_IMAGE_IN_MB = 2;
  static const int OTHERS_ID = 1;
  static const String EGYPT_COUNTRY_CODE = "+20";

  static const int ZERO = 0;
  static const String ENV_DEV_PATH = "assets/env/env_prod.env";
  static const String ENV_BASE_PATH = "assets/env/env_base.env";

  ///[API static Constant]
  ///
  static const String AUTHENTICATION_TOKEN = "authenticationToken";
  static const String TOKEN_EXPIRED = "token-expired";
  static const String TOKEN = "token";
  static const String REASON = "reason";
  static const String IMAGE = "image";
  static const String TRUE = "true";
  static const String DATE = "date";
  static const String HASHED_NO = "hashed_no";
  static const String PROVIDER = "provider";
  static const String TRANS_REF = "trans_ref";
  static const String CARD_TOKEN = "card_token";

  static const String CITY_ID = "city_id";
  static const String PERSONAL_ID = "personal_id";
  static const String TEXT = "text";
  static const String ALL = "all";
  static const String FAILED = "failed";
  static const String PAGE_SIZE = "pageSize";
  static const String PAGE_NUMBER = "pageNumber";
  static const double FIXED_SHIPPING_FEES = 0;
  static const String ZERO_RESULTS = "ZERO_RESULTS";

  ///[API static Constant]

  ///[Translation static consts]
  ///
  static const String MALE = "male";
  static const String INFO = "info";
  static const String PRODUCTS = "products";
  static const String FEMALE = "female";
  static const String SKIP = "skip";
  static const String DONE = "done";
  static const String UPDATE_PARAM_DONE = "paramDone";
  static const String SOCIAL_LOGIN_CANCELLED = "socialNotCompleted";
  static const String INVALID_EMAIL = "invalidEmail";
  static const String INVALID_PASSWORD = "invalidPassword";
  static const String INVALID_INPUT = "invalidInput";
  static const String ATTACH_PHOTO_IMAGE = "attachPhotoImage";
  static const String MORE = "More";

  static const String AVAILABLE = "available";
  static const String NOT_AVAILABLE = "notAvailable";
  static const String VALUE = "value";
  static const String ID = "id";
  static const String HOME = "home";
  static const String SHOPS = "shops";
  static const String HAS_HOME_SERVICE = "hasHomeService";
  static const HAS_HOME_DELIVERY = "hasHomeDelivery";

  static const String SEARCH = "search";
  static const String RESERVATION = "reservation";
  static const String MY_RESERVATION = "myReservation";
  static const String SELECT_DATE = "selectDate";
  static const String REPORTS = "reports";
  static const String CONTACT_US = "contactUs";
  static const String PRIVACY_POLICY = "privacyPolicy";
  static const String SEARCH_IN = "searchIn";
  static const String NAME_FOR = "nameFor";
  static const String OR = "Or";
  static const String NAME_PARAM = "name";
  static const String PRICE_PARAM = "price";
  static const String TRANSACTION_NO = "transaction_nu";
  static const String AREA = "area";
  static const String EMPTY_RESULT = "emptyResult";
  static const PAYMENT_METHODS_STRING = "payment_method";
  static const PAYMENT_METHOD = "paymentMethod";
  static const String EMPTY_TITLE = "";
  static const String ORDER_DONE_SUCCESSFULLY = "orderDoneSuccess";
  static const String ORDER_STATUS_ID = "order_status_id";
  static const String ORDER_STATUS = "order_status";
  static const String IS_PAID = "is_paid";
  static const String SEND_STATEMENT = "send_statement";
  static const String ORDER_DONE = "orderDone";

  static const String TYPE = "type";
  static const String SPEC = "spec";
  static const String LOGIN = "login";
  static const String LOGIN_TO_ACCOUNT = "loginToAccount";
  static const String SAR = "sar";

  static const String KG = "KG";

  static const String INVALID_CONNECTION = "invalidConnection";
  static const String VISIT_PRICE = "visitPrice";
  static const String ADDRESS = "address";
  static const String BUY_ACTION = "buy_action";
  static const String WIN = "win";
  static const String EN = "en";
  static const String AR = "ar";
  static const String EMAIL = "email";
  static const String USER_NAME = "username";
  static const String GET_STARTED = "getStarted";
  static const String FULL_NAME = "fullname";
  static const String CHANGE_PASSWORD = "changePassword";
  static const String CHANGE = "change";
  static const String CHANGE_PASSWORD2 = "changePassword2";
  static const String OLD_PASSWORD = "oldPassword";
  static const String NEW_PASSWORD = "newPassword";
  static const String PASSWORD = "password";
  static const String NAME = "name";
  static const String PROVIDER_ID = "provider_id";
  static const String PROVIDER_NAME = "provider_name";
  static const String PUSH_TOKEN = "push_token";
  static const String PERSON_NAME = "personName";
  static const String PERSON_DATE_OF_BIRTH = "personDateOfBirth";
  static const String PERSON_GENDER = "personGender";
  static const String VIEW = "view";
  static const String PROFILE = "profile";
  static const String PROFILE_ID = "profile_id";
  static const String CITY = "city";
  static const String LOGOUT = "logout";
  static const String SEARCH_RESULT = "searchResult";
  static const String FORGET_PASSWORD = "forgetPassword";
  static const String RECOVER = "Recover";
  static const String RECOVER_PASSWORD = "recoverPassword";
  static const String RESET_PASSWORD = "resetPassword";
  static const String RESET = "reset";
  static const String NEW_ACCOUNT = "newAccount";
  static const String CONFIRM_PASSWORD = "confirmPassword";
  static const String CONFIRMATION = "confirmation";
  static const String SIGNUP = "signup";
  static const String SIGNUP_SHORT = "signup2";
  static const String MOBILE = "mobileNO";
  static const String PHONE = "phone";
  static const String PHONE_NUMBER = "phoneNumber";
  static const String CR_NUMBER = "cr_nu";
  static const String CR_FILE = "cr_file";
  static const String FILTER = "filter";
  static const String BANK_NAME = "bank_name";
  static const String ACCOUNT_NUMBER = "account_nu";
  static const String TITLE = "title";
  static const String IBAN = "iban";
  static const String PRODUCT_NAME = "product_name";
  static const String SELLING_PRICE = "sellingPrice";

  static const String NOT_REGISTERED_NUMBER = "notRegistered";
  static const String REGISTERED_NUMBER = "قegisteredNumber";
  static const String MESSAGE = "message";
  static const String NOTES = "notes";
  static const String MOBILE_NUMBER = "mobileNumber";
  static const String IS_SUCCESS = "is_success";
  static const String AGE = "age";
  static const String GENDER = "gender";
  static const String BIRTH_DATE = "birthDate";
  static const String DATE_OF_BIRTH = "dateOfBirth";
  static const String DELETE_ACCOUNT = "deleteAccount";
  static const String CANCEL_RESERVATION = "cancelReservation";
  static const String CANCELLED = "cancelled";

  static const String MESSAGE_TITLE = "messageTitle";
  static const String MESSAGE_BODY = "messageBody";
  static const String SEND = "send";
  static const String INVALID_TITLE = "invalidTitle";
  static const String INVALID_START_TIME = "invalidStartTime";
  static const String INVALID_END_TIME = "invalidEndTime";
  static const String END_TIME_GREATER_THAN_START = "invalidEndGreaterStart";
  static const String SHORT_MESSAGE = "shortMessage";
  static const String INVALID_MESSAGE = "invalidMessage";
  static const String INVALID_SHORT_MESSAGE = "invalidShortMessage";
  static const DELETE = "delete";
// static const POST_TITLE = "postTitle";
  static const String VIDEO_URL = "videoUrl";
  static const SURE = "sure";
  static const String STORE_ID = "store_id";
  static const String KEYWORD = "keyword";
  static const int TYPE_AHEAD_DURATION = 700; // 700 milliseconds
  static const String PRODUCT_ID = "product_id";
  static const String DELIVERY_NAME = "delivery_name";
  static const String DELIVERY_MOBILE = "delivery_mobile";
  static const String QUANTITY = "quantity";
  static const String OFFER_AMOUNT = "offer_amount";
  static const String OFFER_WEIGHT = "offer_weight";
  static const String REQUEST_ID = "request_id";
  static const String DELIVERY_ADDRESS = "delivery_address";
  static const String DELIVERY_EMAIL = "delivery_email";
  static const String INVALID_MOBILE = "invalidNO";
  static const String INVALID_NAME = "invalidName";
  static const String INVALID_VAT = "invalidVat";
  static const String INVALID_CR = "invalidCr";
  static const String INVALID_CITY = "invalidCity";
  static const String INVALID_CAT = "invalidCat";
  static const String INVALID_FILE = "invalidFile";
  static const String INVALID_ID = "invalidId";
  static const String INVALID_PRICE = "invalidPrice";

  static const String INVALID_TIME = "invalidTime";
  static const String INVALID_ADDRESS = "invalidAddress";

  static const String CREATE_REQUEST = "createRequest";
  static const String CATEGORIES = "categories";
  static const String OR_LOGIN = "orLogin";
  static const String OR_SIGNUP = "orSignup";
  static const String ORDERS = "orders";

  static const String VAT = "vat";
  static const String COUNTRY = "Country";
  static const String COUNTRY_ID = "country_id";
  static const String ACCOUNT = "Account";
  static const String MY_ACCOUNT = "myAccount";
  static const String PAYMENTS = "payments";
  static const String TERMS_AND_COND = "termsAndCond";
  static const String LANGUAGE = "language";
  static const String EDIT_PROFILE = "editProfile";
  static const String CREDIT_CARD = "creditCard";
  static const String EDIT = "edit";
  static const String EXPIRY_DATE = "expiryDate";
  static const String EXPIRED = "expired";
  static const String START_ON = "startOn";

  static const String CVV_NUMBER = "cvvNumber";
  static const String DEFAULT_PAYMENT = "defaultPayment";
  static const String FREQ_ASK = "faq";
  static const String YES = "yes";
  static const String NO = "no";
  static const String ADD_PAYMENT = "addPayment";
  static const String FACEBOOK = "facebook";
  static const String GOOGLE = "google";
  static const String PROFILE_IMAGE = "image";
  static const String APPLE = "apple";
  static const String UPDATE_PROFILE = "updateProfile";
  static const String SHOULD_UPDATE_PROFILE = "shouldUpdateProfile";
  static const String ALREADY_SENT_REQUEST_MESSAGE = "alreadyRequestMessage";
  static const String PDF = "pdf";
  static const String JPEG = "jpeg";
  static const String JPG = "jpg";
  static const String XLS = "xls";
  static const String XLSX = "xlsx";
  static const String PNG = "png";
  static const String DOC = "doc";
  static const String DOCX = "docx";
  static const String BANK_ACCOUNT = "bankAccount";
  static const String BANK = "bank";

  static const String INVALID_IBAN = "invalidIban";
  static const String ALREADY_SENT = "alreadySent";
  static const String INVALID_ACCOUNT = "invalidAccount";
  static const String SURE_TO_DISMISS_FORM = "sureToDismiss";
  static const String SET_LOCATION = "setLocation";
  static const double INIT_LAT = 24.2471831;
  static const double INIT_LONG = 40.5767197;

  static const String DESCRIPTION = "description";
  static const String ATTACHED = "attached";

  static const String START_TIME = "start_time";
  static const String END_TIME = "end_time";
  static const String START_PRICE = "start_price";
  static const String BUY_PRICE = "buy_price";
  static const String BUY_NOW = "buyNow";
  static const String SIGN_OUT = "signOut";
  static const String BUY = "buy";
  static const String SELL = "sell";
  static const String CATEGORY_ID = "category_id";

  static const String STATUS_ID = "status_id";
  static const String PARENT_CATEGORY_ID = "parent_category_id";
  static const String SUB_CATEGORY_ID = "sub_category_id";

  static const String PRODUCT_DETIALS = "productDetials";

  static const String BUY_NOW_MODAL_ACTION_MESSAGE_WITH_PARAM =
      "buyNowModalMsgWParam";
  static const String YOUR_EMAIL = "yourEmail";
  static const String YOUR_MESSAGE = "yourMessage";
  static const String SUBMIT = "submit";

  static const String BACK = "back";
  static const String MY_PROFILE = "myProfile";
  static const String NUMBER_OF_OFFERS = "numberOfRequests";

  static const String CITIES = "cities";
  static const String ADD_PHOTOS = "addPhotos";

  static const String SELECT_CITY = "selectCity";
  static const String SELECT_CATEGORY = "selectCategory";
  static const String SELECT_SUB_CATEGORY = "selectSubCategory";
  static const String SHARE = "share";

  static const String SAVE_IMAGE = "saveImage";
  static const String SAVE_QR_IMAGE_ALSO = "saveQrImageAlso";
  static const String SAVE = "save";
  static const String ONLY_SHARE = "onlyShare";
  static const String IN_PROGRESS = "inProgress";
  static const String OUT_OF_DELIVERY = "outOfDeliv";
  static const String DELIVERED = "delivered";
  static const String PAYMENT_STATUS = "paymentStatus";
  static const String PAID = "paid";
  static const String UNPAID = "unpaid";
  static const String NO_ORDERS = "noOrders";
  static const String UNKNOWN_STATUS = "unknownStatus";
  static const String ORDER = "order";
  static const String PAYMENT_APPROVED = "paymentApproved";
  static const String PAYMENT_NOT_VERIFIED = "paymentNotVerified";
  static const String CONTACT_SUPPORT = "contactSupport";
  static const String PLEASE_SELECT_IMAGES = "selectImages";
  static const String TOTAL = "total";
  static const String COMPLAIN = "complain";
  static const String SUBMIT_SUCCESS = "submitSucess";

  static const String SEARCH_FOR_TEXT_TITLE = "searchForTextTitle";
  static const String WELCOME_BACK = "welcomeBack";
  static const String ENTER_CREDENTIALS = "enterCredentials";
  static const String DONT_HAVE_ACCOUNT = "dontHaveAccount";

  static const String SOCIAL_ALMOST_COMPLETED = "socialAlmostCompleted";
  static const String CONTINUE = "continue";
  static const String LOGIN_WITH_APPLE = "loginWithApple";
  static const String LOGIN_WITH_FACEBOOK = "loginWithFacebook";
  static const String LOGIN_WITH_GOOGLE = "loginWithGoogle";
  static const String CREATE_ACCOUNT = "createAccount";
  static const String ENTER_PERSONAL_DETAILS = "enterPersonalData";
  static const String ACCEPT_TERMS_AND_COND = "acceptTermsCond";
  static const String ALREADY_HAVE_ACCOUNT = "alreadyHaveAccount";
  static const String COUNTRY_CODE_TEXT = "countryCode";
  static const String SAUDI_ARABIA = "saudiArabia";
  static const String EGYPT = "egypt";
  static const String VERIFICATION_CODE = "verCode";
  static const String VERIFY = "verify";
  static const String WE_SEND_OTP = "weSendCode";
  static const String SHORT_OTP = "shortCode";
  static const String WAIT_FOR_OTP = "waitForCode";
  static const String FIREBASE_INVALID_VERIFICATION_CODE =
      "invalid-verification-code";
  static const String SEARCH_FOR_PRODUCT = "searchForProduct";

  static const String REQUESTS = "requests";
  static const String CANCEL_ORDER = "cancelOrder";
  static const String ALL_STATUSES = "allStatus";
  static const String ALL_PAYMENT = "allPayment";
  static const String SIGNOUT_ARE_YOU_SURE = "signoutAreYouSure";
  static const String UPDATE = "update";
  static const String ADDING_NEW_CARD = "addingNewCard";
  static const String ADDING_CARD = "addingCard";
  static const String NO_CARDS = "noCards";
  static const String DELETE_CARD = "deleteCard";
  static const String CARD_INPUT_WILL_BE_DELETED = "cardWillBeDeleted";
  static const String SELECT_CARD = "selectCard";
  static const String EXIT = "exit";
  static const String EXIT_MESSAGE = "exitMessage";
  static const String REQUEST = "request";
  static const String MESSAGE_SENT_TITLE = "messageSent";
  static const String MESSAGE_SENT_BODY = "messageBodySent";
  static const String MESSAGE_FAILED = "messageFailed";
  static const String ENGLISH = "english";
  static const String ARABIC = "arabic";
  static const String SUBTOTAL = "subtotal";
  static const String DAY = "d";
  static const String HOUR = "h";
  static const String MINUTE = "m";
  static const String SECOND = "s";
  static const String FROM = "from";
  static const String END = "end";
  static const String CHECK_OUT = "checkOut";
  static const String SUMMARY = "summary";
  static const String INSTRUMENT = "instrument";
  static const String INSTRUMENT_PLURAL = "instrument_plural";
  static const String SELECT_YOUR = "selectYour";
  static const String LOCATION = "location";
  static const String CASH_ON_DELIVERY = "cod";
  static const String ONLINE_PAYMENT = "onlinePayment";
  static const String PAYMENT = "payment";
  static const String CONFIRM = "confirm";
  static const String SELECT_PAYMENT_METHOD_ERROR = "selectPaymentMethodError";
  static const String CARD_WILL_BE_USED = "cardWillBeUsed";
  static const String CONGRATS = "congrats";
  static const String CONTINUE_WITH_PAYMENT = "continueWithPayment";
  static const String SORRY_FOR_INCONV = "sorryForInconv";
  static const String CARD = "card";
  static const String CARD_TYPE = "cardType";
  static const String AMOUNT_INPUT = "amountInput";
  static const String ISSUED_INPUT = "issuedInput";
  static const String APPLY_FILTER = "applyFilter";
  static const String APPLY_YOUR_OFFER = "applyYouOffer";
  static const String DAY_ELAPSED = "dayElapsed";
  static const String DAYS_ELAPSED = "daysElapsed";
  static const String MINUTE_ELAPSED = "minutelapsed";
  static const String MINUTES_ELAPSED = "minutesElapsed";
  static const String SECOND_ELAPSED = "secondElapsed";
  static const String SECONDS_ELAPSED = "secondsElapsed";
  static const String HOUR_ELAPSED = "hourElapsed";
  static const String HOURS_ELAPSED = "hoursElapsed";
  static const String NOW = "now";
  static const String NATIONAL_ID = "nationalId";
  static const String CR_REGISTERATION = "crRegisteration";
  static const String NEXT = "next";
  static const String DIGIFIED_ERROR_SIDE = "digifiedErrorSide";
  static const String PENDING_VERIFICATION = "pendingVer";
  static const String CLOSED = "closed";
  static const String REMOVE = "remove";
  static const String SOMETHING_WENT_WRONG = "404Title";
  static const String PLEASE_TRY_AGAIN = "404TryAgain";
  static const String ALL_CITIES_API = "allCities";
  static const String YOU_WON = "youWon";
  static const String REQUESTED = "requested";
  static const String OFFER = "offer";
  static const String OFFERS_INPUT = "offersInput";
  static const String REJECT = "reject";
  static const String ACCEPT = "accept";
  static const String OFFER_ID = "offer_id";
  static const String IS_APPROVED = "is_approved";
  static const String NO_INPUT = "noInput";
  static const String MY_REQUESTS = "myRequests";
  static const String DELETED = "deleted";
  static const String ALREADY_DELETED = "alreadyDeleted";
  static const String SLOGAN_1 = "slogan1";
  static const String SLOGAN_2 = "slogan2";
  static const String SLOGAN_3 = "slogan3";
  static const String SLOGAN_SUB_1 = "sloganSub1";
  static const String SLOGAN_SUB_2 = "sloganSub2";
  static const String SLOGAN_SUB_3 = "sloganSub3";
  static const String ASSET_CLASS = "assetClass";
  static const String MUTUAL_FUND = "mutualFund";
  static const String VIEW_MORE = "viewMore";
  static const String RETRY = "retry";
  static const String FUNDS = "funds";
  static const String MY_FUNDS = "myFunds";
  static const String NOTIFICATIONS = "notify";
  static const String PORTIFOLIO = "portifolio";
  static const String BANK_INFORMATION = "bankInfo";
  static const String TRANSACTION_HISTORY = "transHistory";
  static const String INSIGHTS_AND_PERFORMANCE = "insightAndPerformance";
  static const String EXPERT_SESSION = "expertSession";
  static const String FAQ = "faq";
  static const String ABOUT_US = "aboutUs";
  static const String MY_CARDS = "myCards";
  static const String SUPPORT = "support";
  static const String FAWRY_PAYMENT = "fawryPayment";
  static const String ADD_INPUT = "addInput";
  static const String FAWRY = "fawry";
  static const String NEW_CARD = "newCard";
  static const String NAME_ON_CARD = "nameOnCard";
  static const String CARD_NUMBER = "cardNumber";
  static const String SAVE_AS_DEFAULT = "saveAsDefault";
  static const String INPUT_WITH_DETAILS = "inputWithDetails";
  static const String BANK_ACCOUNTS = "bankAccounts";
  static const String BOOK_NOW = "bookNow";
  static const String PORTFOLIO_DETAILS = "portfolioDetails";
  static const String ASSET_MANAGEMENT = "assetManagement";
  static const String VERIFY_ACCOUNT = "verifyAccount";
  static const String REVIEW_ACCOUNT = "reviewAccount";
  static const String RULES = "rules";
  static const String CAPTURE = "capture";
  static const String VERIFY_IMAGE_INPUT = "verifyImageInput";
  static const String FRONT_ID = "frontId";
  static const String BACK_ID = "backId";
  static const String DISMISS = "dismiss";

  ///[Translation static consts]

}
