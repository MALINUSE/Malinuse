# encoding: utf-8

namespace :initial do
  desc "Fill database with sample datara"
  task create: :environment do

    Rake::Task['db:drop'].invoke
    puts "===> db drop!"
    Rake::Task['db:create'].invoke
    puts "===> db create!"
    Rake::Task['db:migrate'].invoke
    puts "===> db migrate!"
    Rake::Task['assets:precompile'].invoke
    puts "===> Assets precompile !"
    Rake::Task['middleware'].invoke
    puts "===> Middleware!"


  end

end