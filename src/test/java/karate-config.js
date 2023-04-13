function fn() {
  var env = karate.env; // get system property 'karate.env'

  if (!env) {
    env = 'dev';
  }
  var config = {
    baseUrl: 'https://reqres.in/',
    hooksPath: 'classpath:hooks/'
  }

  return config;
}