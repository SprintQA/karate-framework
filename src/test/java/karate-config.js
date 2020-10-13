function loadConfigurations() {
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
    petstoreUrl: 'https://petstore.swagger.io/v2',
    contentType: 'application/json',
    apiKey: 'special-key'
  };
  if (env == 'qa') {
    // over-ride only those that need to be
    config.petstoreUrl = 'https://petstore.swagger.io/v1';
  } else if (env == 'e2e') {
    config.petstoreUrl = 'https://petstore.swagger.io/v2';
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}