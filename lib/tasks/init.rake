namespace :init do
  desc 'dotenv init'
  task :dotenv do
    origin = Rails.root.join('.env.sample')
    target = Rails.root.join('.env')
    if File.exist?(target)
      puts 'exist .env'
    else
      FileUtils.cp(origin, target)
      puts 'copy .env.sample -> .env success'
    end
  end

  desc 'database.yml init'
  task :database do
    origin = Rails.root.join('config', 'database.yml.sample')
    target = Rails.root.join('config', 'database.yml')
    if File.exist?(target)
      puts 'exist config/database.yml'
    else
      FileUtils.cp(origin, target)
      puts 'copy config/database.yml.sample -> config/database.yml success'
    end
  end
end
