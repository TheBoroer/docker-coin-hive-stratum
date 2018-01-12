const Proxy = require("coin-hive-stratum");
const proxy = new Proxy({
  host: "pool.electroneum.hashvault.pro",
  port: 80
});
proxy.listen(80);