yum install -y openssl
mkdir -p /srv/salt/prod/harbor/
cd /srv/salt/prod/harbor/

# Self-signed root certificate
openssl req \
            -newkey rsa:4096 \
            -nodes -sha256 \
            -keyout ca.key \
            -x509 -days 3650 \
            -out ca.crt \
            -subj "/C=CN/ST=Zhejiang/L=Ningbo/O=nbnbnb CA./OU=IT/CN=*"

# Certificate signing request
openssl req -new \
            -newkey rsa:4096 \
            -sha256 -nodes \
            -out nbnbnb.org.csr \
            -keyout nbnbnb.org.key \
            -subj "/C=CN/ST=Zhejiang/L=Ningbo/O=nbnbnb Org./OU=IT/CN=*.nbnbnb.org"

# Generate a certificate for the registry host
openssl x509 -req \
             -days 3650 \
             -in nbnbnb.org.csr \
             -CA ca.crt \
             -CAkey ca.key \
             -CAcreateserial \
             -out nbnbnb.org.crt


