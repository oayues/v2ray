#cd /v2raybin
#echo -e "$CONFIG_JSON" > config.json
#if [ "$CERT_PEM" != "$KEY_PEM" ]; then
#  echo -e "$CERT_PEM" > cert.pem
#  echo -e "$KEY_PEM"  > key.pem
#fi

cd /v2ray
wget -O v2ray.zip http://github.com/v2ray/v2ray-core/releases/download/v4.18.0/v2ray-linux-64.zip
unzip v2ray.zip 
if [ ! -f "v2ray" ]; then
  mv /v2ray/v2ray-v4.18.0-linux-64/v2ray .
  mv /v2ray/v2ray-v4.18.0-linux-64/v2ctl .
  mv /v2ray/v2ray-v4.18.0-linux-64/geoip.dat .
  mv /v2ray/v2ray-v4.18.0-linux-64/geosite.dat .
fi

cp -f /config.json .
chmod +x v2ray v2ctl
sed -i "s/ab21fd2f-125b-4e54-9932-51783d3db9f6/$UUID/g" config.json
./v2ray
