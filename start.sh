#/bin/sh
if [ ! -f /usr/share/nginx/html/conf/config.js ]; then
  cp /app/public/conf/config.js /usr/share/nginx/html/conf
fi

if [ $API_URL ]; then
  echo "Bawaan: $API_URL"
  sed -i "s#http://sub.bonds.id#$API_URL#g" /usr/share/nginx/html/conf/config.js
else
  echo "Bawaan: https://martoleh.vercel.app/"
  echo "Manual -e API_URL='https://sub.ops.ci'"
fi

if [ $SITE_NAME ]; then
  sed -i "s#Subconverter Web#$SITE_NAME#g" /usr/share/nginx/html/conf/config.js
fi

nginx -g "daemon off;"
