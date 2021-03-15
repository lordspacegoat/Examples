# Deploy Laravel via Jenkins

This is the process to build and deploy a laravel application from SCM to a web server. Using webhook triggers we are able to run builds based on the branch the commit came from. eg Development commits trigger the dev environment build while Master commits trigger the prod environment build and maybe Staging commits trigger a staging build.

## Required Plugins

A few plugins are needed to make this work:

- Generic Webhook Triggers
- Send build artifacts over SSH
- Slack notifications

1. Add Source Code Repository

![Source Code Repo](https://github.com/dapperandy/Examples/blob/main/jenkins/sourcecode.png)

2. Create Webhook triggers

![WebHook Triggers](https://github.com/dapperandy/Examples/blob/main/jenkins/webhook.png)

3. Pre-Build Step

```
ls
cd .. 
ls
tar -czvf dev.pefoma-build.tar.gz pefoma.dev/ --exclude=pefoma.dev/*.git*
mv ~/workspace/dev.pefoma-build.tar.gz pefoma.dev/dev.pefoma-build.tar.gz
cd pefoma.dev
```

4. Post-Build Step Build Artifacts Over SSH

![Post Build Step](https://github.com/dapperandy/Examples/blob/main/jenkins/postbuild.png)

```
cd /var/www/html/
sudo chown ubuntu:ubuntu dev.pefoma-build.tar.gz
tar -xzvf dev.pefoma-build.tar.gz
rm -rf dev.pefoma-build.tar.gz
cp -rf pefoma.dev/* /var/www/html/
rm -rf pefoma.dev/*
cp /var/www/pefoma.env /var/www/html/.env
cp /var/www/FirebaseKey.json /var/www/html/FirebaseKey.json
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
```

5. Notify the team a job is running and if it completes.

![Slack Notify](https://github.com/dapperandy/Examples/blob/main/jenkins/slacknotify.png)


![Slack Notify 2](https://github.com/dapperandy/Examples/blob/main/jenkins/slacknotify2.png)


