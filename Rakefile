require 'rake'
require 'date'
require 'yaml'

namespace :site do
  desc "Generate the site and push changes to remote origin"
  task :deploy, :config do |t, args|
    # Detect pull request
    if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
      puts 'Pull request detected. Not proceeding with deploy.'
      exit
    end

    config = YAML.load(File.read(args.config.to_s))
    username = config["username"]
    repo = config["repo"]
    source_branch = config["fetch"]
    destination_branch = config["push"]
    destination = config["destination"]

    # configure git if this is run in Travis CI
    if ENV["TRAVIS"]
      sh "git config --global user.name $GIT_NAME"
      sh "git config --global user.email $GIT_EMAIL"
      sh "git config --global push.default simple"
    end

    # Make sure destination folder exists as git repo
    unless Dir.exist? config["destination"]
      sh "git clone https://$GIT_NAME:$GH_TOKEN@github.com/#{username}/#{repo}.git #{config["destination"]}"
    end

    sh "git checkout #{source_branch}"
    Dir.chdir(config["destination"]) { sh "git checkout #{destination_branch}" }

    # Generate the site
    sh "bundle exec jekyll build --config " + args.config.to_s

    # Commit and push to github
    sha = `git log`.match(/[a-z0-9]{40}/)[0]
    Dir.chdir(config["destination"]) do
      sh "git add --all ."
      sh "git commit -m 'Updating to #{username}/#{repo}@#{sha}.'"
      sh "git push --quiet origin #{destination_branch}"
      puts "Pushed updated branch #{destination_branch} to GitHub Pages"
    end
  end
end
