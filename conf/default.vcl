vcl 4.0;

backend default {
  .host = "${VARNISH_BACKEND_IP}";
  .port = "${VARNISH_BACKEND_PORT}";
}