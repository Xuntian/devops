#
external_url 'http://git.keepwork.com'

gitlab_rails['db_adapter'] = "postgresql"
gitlab_rails['db_encoding'] = "unicode"
gitlab_rails['db_database'] = "gitlab"
gitlab_rails['db_pool'] = 10
gitlab_rails['db_username'] = "gitlab"
gitlab_rails['db_password'] = "123456"
# gitlab_rails['db_host'] = "10.28.18.3"
gitlab_rails['db_host'] = ENV['DATABASE_HOST']
gitlab_rails['db_port'] = 5432
# gitlab_rails['redis_host'] = "10.28.18.3"
gitlab_rails['redis_host'] = ENV['REDIS_HOST']
gitlab_rails['redis_port'] = 6379
gitlab_rails['redis_database'] = 0
postgresql['enable'] = false
redis['enable'] = false
nginx['enable'] = true
nginx['redirect_http_to_https'] = true


### OmniAuth Settings
###! Docs: https://docs.gitlab.com/ce/integration/omniauth.html
gitlab_rails['omniauth_enabled'] = true
# gitlab_rails['omniauth_allow_single_sign_on'] = ['github']
# gitlab_rails['omniauth_auto_sign_in_with_provider'] = 'saml'
gitlab_rails['omniauth_block_auto_created_users'] = true
# gitlab_rails['omniauth_auto_link_ldap_user'] = false
# gitlab_rails['omniauth_auto_link_saml_user'] = false
# gitlab_rails['omniauth_external_providers'] = ['twitter', 'google_oauth2']
gitlab_rails['omniauth_providers'] = [
   {
     "name" => "github",
     "app_id" => "f6ebc98d3308417bde83",
     "app_secret" => "4a960a11ddf5136fa29a41e9688eba3897094373",
     "args" => { "scope" => "user:email" }
   }
 ]

gitlab_rails['gitlab_ssh_host'] = 'ssh.keepwork.com'
gitlab_rails['gitlab_shell_ssh_port'] = 22
gitlab_rails['git_max_size'] = 209715200


gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.exmail.qq.com"
gitlab_rails['smtp_port'] = 465
gitlab_rails['smtp_user_name'] = "noreply@mail.keepwork.com"
gitlab_rails['gitlab_email_from'] = 'noreply@mail.keepwork.com'
gitlab_rails['smtp_password'] = "M3Hbhq6KAZzagFP4"
# gitlab_rails['smtp_domain'] = "smtp.qq.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = true

#nginx['client_max_body_size'] = '250m'
#nginx['client_max_body_size'] = '0'

nginx['custom_gitlab_server_config'] = "location ~ ^/[^a][^p][^i].*\\.md$ {\n proxy_cache gitlab;\n proxy_pass  http://gitlab-workhorse; \n add_header Access-Control-Allow-Origin '*';\n}\n"

git_data_dirs({"default" => "/gitlab-data/git-data"})
gitlab_rails['uploads_directory'] = '/gitlab-data/uploads'
gitlab_rails['shared_path'] = '/gitlab-data/shared'
gitlab_ci['builds_directory'] = '/gitlab-data/builds'