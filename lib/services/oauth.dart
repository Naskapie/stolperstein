import 'dart:io';

import 'package:oauth2/oauth2.dart';
import 'config.dart';

final BASE_OAUTH_URL = 'https://www.openstreetmap.org/oauth/';
// BASE_OAUTH_URL + "request_token";

final authorizationEndpoint = Uri.parse(BASE_OAUTH_URL + 'authorize');
final tokenEndpoint = Uri.parse(BASE_OAUTH_URL + 'access_token');

final identifier = IDENTIFIER;
final secret = SECRET;

final redirectUrl = Uri.parse(REDIRECT_URL);
final credentialsFile = File(CREDENTIALS_FILE);
