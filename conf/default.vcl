vcl 4.0;

backend default {
  .host = "${VARNISH_BACKEND_IP}";
  .port = "${VARNISH_BACKEND_PORT}";
  .probe = {
      .url = "/";
      .timeout = 40ms;
      .interval = 1s;
      .window = 10;
      .threshold = 8;
    }
}

# Respond to incoming requests.
sub vcl_recv {
  # Allow the backend to serve up stale content if it is responding slowly.
  set req.grace = 60s;
}

# Code determining what to do when serving items from the Apache servers.
sub vcl_fetch {
  # Allow items to be stale if needed.
  set beresp.grace = 60s;
}