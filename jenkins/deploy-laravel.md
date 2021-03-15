Add Source Code Repository

Create Webhook triggers

Pre-Build Step

ls
cd .. 
ls
tar -czvf dev.pefoma-build.tar.gz pefoma.dev/ --exclude=pefoma.dev/*.git*
mv ~/workspace/dev.pefoma-build.tar.gz pefoma.dev/dev.pefoma-build.tar.gz
cd pefoma.dev

Build Artifacts Over SSH

cd /var/www/html/
sudo chown ubuntu:ubuntu dev.pefoma-build.tar.gz
tar -xzvf dev.pefoma-build.tar.gz
rm -rf dev.pefoma-build.tar.gz
cp -rf pefoma.dev/* /var/www/html/
rm -rf pefoma.dev/*
cp /var/www/pefoma.env /var/www/html/.env
cp /var/www/FirebaseKey.json /var/www/html/jenkins/pefoma/FirebaseKey.json
mkdir -p /var/www/html/storage/framework/{sessions,views,cache}
mkdir /var/www/html/storage/logs
cd /var/www/html/
composer install
composer dump-autoload
php artisan config:cache
php artisan key:generate --force
php artisan passport:keys
php artisan view:clear
php artisan route:cache
php artisan cache:clear
php artisan schedule:run

