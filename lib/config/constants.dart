library Constants;

/*
 * App resources
 */
const String ASSETS_IMAGES_FOLDER = "assets/images/";
const String APP_ICON_FILENAME = ASSETS_IMAGES_FOLDER + "green-apple.png";

/*
 * RESTful API
 */
const String REST_API_ROOT  = "https://reqres.in/api/";
const String REST_API_LOGIN = "login";
const String REST_API_USERS = "users";

/*
 * User roles
 */
const String ROLE_ADMINISTRATOR = "ADMINISTRATOR";
const String ROLE_CLIENT        = "CLIENT";

/*
 * Pages constants
 */
const String PAGE_LOGIN         = "login";
const String PAGE_HOME          = "home";
const String PAGE_USER_PROFILE  = "userProfile";

/*
 * Views properties
 */
enum ViewStatus { Idle, Busy }