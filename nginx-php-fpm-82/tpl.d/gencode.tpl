server {
    listen   8015; ## listen for ipv4; this line is default and implied
    listen   [::]:8015 default ipv6only=on; ## listen for ipv6

    client_max_body_size 10M;

    root /var/www/html/public;
    index index.php index.html index.htm;

    # Make site accessible from http://localhost/
    server_name _;

    # Disable sendfile as per https://docs.vagrantup.com/v2/synced-folders/virtualbox.html
    sendfile off;

    # Security - Hide nginx version number in error pages and Server header
    server_tokens off;

    # Add stdout logging
    error_log /dev/stdout info;
    access_log /dev/stdout;

    # reduce the data that needs to be sent over network
    gzip on;
    gzip_min_length 10240;
    gzip_proxied expired no-cache no-store private auth;
    gzip_types text/plain text/css text/xml application/json text/javascript application/x-javascript application/xml;
    gzip_disable "MSIE [1-6]\.";

    include /etc/nginx/general.conf;
}