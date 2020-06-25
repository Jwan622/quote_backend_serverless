## To deploy:
1. rbenv install 2.7.0
2. rbenv use 2.7.0
3. bundle install --deployment
4. sls deploy


## Important deployment Commands:
1. sls deploy : deploys function adn cloudformation stack and all relevant folders like gems
2. bundle install --deployment : to bundle gems in vendor/bundle
3. serverless deploy function -f <function_name> : to change code only
