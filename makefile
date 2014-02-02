main:
	@bundle install
	@bundle exec bourbon install --path source/stylesheets/framework
	@cd source/stylesheets/framework; bundle exec neat install; cd ../../