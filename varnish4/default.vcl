#
# This is an example VCL file for Varnish.
#
# It does not do anything by default, delegating control to the
# builtin VCL. The builtin VCL is called when there is no explicit
# return statement.
#
# See the VCL chapters in the Users Guide at https://www.varnish-cache.org/docs/
# and http://varnish-cache.org/trac/wiki/VCLExamples for more examples.

# Marker to tell the VCL compiler that this VCL has been adapted to the
# new 4.0 format.

vcl 4.0;

# Default backend definition. Set this to point to your content server.
backend fhrd {
    .host = "www.fhrd.gov.cn";
    .port = "80";
}

backend jcy {
    .host = "jcy.fh.gov.cn";
    .port = "80";
}
backend fhast {
    .host = "www.fhast.net";
    .port = "80";
}
backend fhhq {
    .host = "www.fhhq.gov.cn";
    .port = "80";
}

backend zs {
    .host = "zs.fh.gov.cn";
    .port = "80";
}
backend fhkj {
    .host = "www.fhkj.net";
    .port = "80";
}
backend fhsj {
    .host = "www.fhsj.gov.cn";
    .port = "80";
}
backend fhjs {
    .host = "www.fhjs.gov.cn";
    .port = "80";
}
backend gjj {
    .host = "gjj.fh.gov.cn";
    .port = "80";
}

sub vcl_recv {
    if (req.http.host == "www.fhrd.gov.cn") {
        set req.backend_hint = fhrd;
    } elseif (req.http.host == "www.zjfenghua.jcy.gov.cn" || req.http.host == "jcy.fh.gov.cn") {
      set req.backend_hint = jcy;
    } elseif (req.http.host == "www.fhast.net") {
      set req.backend_hint = fhast;
    } elseif (req.http.host == "www.fhhq.gov.cn") {
      set req.backend_hint = fhhq;
    } elseif (req.http.host == "zs.fh.gov.cn") {
      set req.backend_hint = zs;
    } elseif (req.http.host == "www.fhkj.net") {
      set req.backend_hint = fhkj;
    } elseif (req.http.host == "www.fhsj.gov.cn") {
      set req.backend_hint = fhsj;
    } elseif (req.http.host == "www.fhjs.gov.cn") {
      set req.backend_hint = fhjs;
    } elseif (req.http.host == "gjj.fh.gov.cn") {
      set req.backend_hint = gjj;
    }

    if (req.method != "GET" && req.method != "HEAD") {
        return(pass);
    }

    # Happens before we check if we have this in cache already.
    #
    # Typically you clean up the request here, removing cookies you don't need,
    # rewriting the request, etc.
}

sub vcl_synth {
  if (resp.status == 750) {
    if (resp.reason == "adminlaw") {
      set resp.http.Location = "http://xyz.example.com/adminlaw/";
      set resp.status = 302;
      return(deliver);
    } elseif (resp.reason == "xyfhindex") {
      set resp.http.Location = "uuu.example.com";
      set resp.status = 302;
      return(deliver);
    }
  }
}

sub vcl_backend_response {
    # Happens after we have read the response headers from the backend.
    #
    # Here you clean the response headers, removing silly Set-Cookie headers
    # and other mistakes your backend does.
}

sub vcl_deliver {
    # Happens when we have all the pieces we need, and are about to send the
    # response to the client.
    #
    # You can do accounting or modifying the final object here.
}
