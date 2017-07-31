namespace :init do
  desc 'dotenv init'
  task :dotenv do
    origin = Rails.root.join('.env.sample')
    target = Rails.root.join('.env')
    unless File.exist?(target)
      FileUtils.cp(origin, target)
      puts 'copy .env.sample -> .env success'
    else
      puts 'exist .env'
    end
  end

  desc 'database.yml init'
  task :database do
    origin = Rails.root.join('config/database.yml.sample')
    target = Rails.root.join('config/database.yml')
    unless File.exist?(target)
      FileUtils.cp(origin, target)
      puts 'copy config/database.yml.sample -> config/database.yml success'
    else
      puts 'exist config/database.yml'
    end
  end
end
