# nginx-spaces-auth

A Docker container for proxying private DigitalOcean Spaces buckets publicly within management droplets.

NOTE: Writing to the bucket through the proxy is not well-tested. It was really just intended to standup
read-only access to files hosted within spaces. It will probably work, but may need Nginx tweaks. It is
assumed that you already are using the regular Spaces API and know how to read/write keys directly to
and from the API itself without going through the proxy.

## Usage

1. `docker build -t nginx-s3-auth .`
2. `docker run -p 8000:8000 -e ACCESS_KEY=foo -e SECRET_KEY=bar -e BUCKET=my-bucket nginx-s3-auth`
3.  Upload the helper listing:
    There is a "helper" HTML file (listing.html) which you can drop into the top-level of the bucket
    you're interested in which will auto-magically list all of the files in your bucket's folder hierarchy
    just as they show up on the Spaces webpage.

    Once the container is running you should be able to visit: http://example.com:8000/listing.html
    and see all of your contents.


(NOTE: ./run.sh in the Dockerfile does support basic HTTP auth, but I've commented that out
since this is for internal consumption of spaces buckets.)
If you do uncomment it, note that the encrypted-password is crypt() format and will go into the htpasswd file.
It can be generated with Apache's `htpasswd` utility or `openssl passwd` among
other methods.

