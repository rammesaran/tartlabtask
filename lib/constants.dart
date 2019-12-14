enum Enviroment { DEV, STAGING, PROD }

class Constants {
  static Map<String, dynamic> _config;

  static void setEnviroment(Enviroment env) {
    switch (env) {
      case Enviroment.DEV:
        _config = _Config.devConstants;
        break;
      case Enviroment.STAGING:
        _config = _Config.stagingConstants;
        break;
      case Enviroment.PROD:
        _config = _Config.prodConstants;
        break;
      default:
    }
  }

  static get serverUrl {
    return _config[_Config.SERVER_URL];
  }

  static get clientId {
    return _config[_Config.CLIENT_ID];
  }

  static get clientSecret {
    return _config[_Config.CLIENT_SECREAT];
  }

  static get grantType {
    return _config[_Config.GRANT_TYPE];
  }

  static get providers {
    return _config[_Config.PROVIDERS];
  }
}

class _Config {
  static const SERVER_URL = 'https://store.tartlabs.com/';
  static const CLIENT_ID = '3';
  static const CLIENT_SECREAT = 'uaiuZ1qNciJVHsE6D383czN3IOsf48SktI2xi4hh';
  static const GRANT_TYPE = 'password';
  static const PROVIDERS = 'user';

  static Map<String, dynamic> devConstants = {
    SERVER_URL: "https://store.tartlabs.com/",
    CLIENT_ID: "3",
    CLIENT_SECREAT: "uaiuZ1qNciJVHsE6D383czN3IOsf48SktI2xi4hh",
    GRANT_TYPE: "password",
    PROVIDERS: "user",
  };
  static Map<String, dynamic> stagingConstants = {
    SERVER_URL: "https://store.tartlabs.com/",
    CLIENT_ID: "3",
    CLIENT_SECREAT: "uaiuZ1qNciJVHsE6D383czN3IOsf48SktI2xi4hh",
    GRANT_TYPE: "password",
    PROVIDERS: "user",
  };
  static Map<String, dynamic> prodConstants = {
    SERVER_URL: "https://store.tartlabs.com/",
    CLIENT_ID: "3",
    CLIENT_SECREAT: "uaiuZ1qNciJVHsE6D383czN3IOsf48SktI2xi4hh",
    GRANT_TYPE: "password",
    PROVIDERS: "user",
  };
}
