# WF Platform

This project uses rvm. 
```
gem install bundle 
bundle install 

```

Create psql database 

```
CREATE database wf_platform_development

```

Run database migration, before running the command make sure to add the config/master.key 

```
rake db:migrate

```

