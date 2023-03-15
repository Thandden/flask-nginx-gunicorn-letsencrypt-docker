# Docker Flask Gunicorn Nginx Letsencrypt boilerplate

Deploy a Flask application with Gunicorn and NGINX as a reverse proxy. Then automate certificates with Letsencrypt.


# Instructions

Make sure Docker and Docker-compose are installed on your machine. Your domain must also be pointing to your machine IP address. Update the A records.

Clone repo:

    git clone https://github.com/Thandden/flask-nginx-gunicorn-letsencrypt-docker.git

Change DOMAIN_NAME env variables in docker-compose.yml files.

Change example@example.com and example.com in ssl-renew.sh file. 

Run a Letsencrypt container in stand alone mode to generate cert files. Change the absolute paths to your repo directory:

    docker run --rm -p 8080:8080 --name certbot -v "/path/repo/certbot-data:/etc/letsencrypt" -v "/path/repo/certbot-var:/var/lib/letsencrypt" certbot/certbot certonly --standalone --agree-tos --email example@example.com  -d example.com --renew-by-default

This will generate the key files which NGINX will use for certification.

Now build the application containers:

    docker-compose up -d --build
 Confirm your application is running and SSL is configured:
 

    https://example.com
  Finally, create a cron job to renew the certificates every week. Make sure you use an absolute path for the ssl-renew.sh script:
  

    crontab -e
   
Add cron:

    
    0 0 * * 0 /path/repo/ssl-renew.sh
 Your application will now have renewed certificates every Sunday. 
