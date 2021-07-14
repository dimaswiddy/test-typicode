function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    baseUrls : {
                 typicodeSystem : "https://jsonplaceholder.typicode.com"
            },
    jsonResourcePath : "classpath:resource/json"
  }
  if (env == 'dev') {
    baseUrls : {
                 config.baseUrls.typicodeSystem = "https://jsonplaceholder.typicode.com"
            }
  } else if (env == 'staging') {
    // customize
  }
  return config;
}