angular.module('app').factory('configService', function() {
  return {
    load_config: function(config) {
      var i, idx, j, k, ref, s, t, v, v1, v2, v3;
      this._config || (this._config = {});
      for (k in config) {
        v = config[k];
        this._config[k] = v;
      }
      this._config;
      t = this._config.t;
      idx = t.indexOf('.');
      this._config.app_id = v1 = t.slice(0, +(idx - 1) + 1 || 9e9);
      s = t.slice(idx + 1, +(t.length - 1) + 1 || 9e9);
      v2 = "";
      v3 = "";
      for (i = j = 0, ref = s.length - 1; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
        if (i % 2 === 0) {
          v2 += s[i];
        } else {
          v3 += s[i];
        }
      }
      if (v2[v2.length - 1] === 'X') {
        v2 = v2.slice(0, +(v2.length - 2) + 1 || 9e9);
      }
      this._config.api_key = v2;
      this._config.api_secret = v3;
      return this._config.cloud = Cloud({
        'app id': v1,
        host: this._config.api_url,
        key: v2,
        secret: v3
      });
    },
    env: function(property) {
      return this._config[property];
    }
  };
});