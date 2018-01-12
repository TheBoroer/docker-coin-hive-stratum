const Proxy = require("coin-hive-stratum");
const domain = "yourdomain.com"
const proxy = new Proxy({
  host: "pool.supportxmr.com",
  port: 3333,
  key: require("fs").readFileSync("/etc/letsencrypt/live/" + domain + "/privkey.pem"),
  cert: require("fs").readFileSync("/etc/letsencrypt/live/" + domain + "/fullchain.pem"),
});
proxy.listen(443);