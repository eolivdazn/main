require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'parallel'
require 'json'
require 'fileutils'

FileUtils.rm_rf'report'

FileUtils::mkdir_p 'report'

browsers = JSON.load(open('browsers.sample.json'))
@parallel_limit = ENV["nodes"] || 1
@parallel_limit = @parallel_limit.to_i

task :cucumber do
  current_browser = ""
  begin
    Parallel.map(browsers, :in_threads => @parallel_limit) do |browser|

      #define reports paths
      os_path = browser['os'].gsub(" ","")
      browser_path = browser['browser'].gsub(" ","")
      FileUtils::mkdir_p "report/#{os_path}/#{browser_path}"

        current_browser = browser
        puts "Running with: #{browser.inspect}"
        ENV['BROWSER'] = browser['browser']
        ENV['BROWSER_VERSION'] = browser['browser_version']
        ENV['OS'] = browser['os']
        ENV['OS_VERSION'] = browser['os_version']

        Cucumber::Rake::Task.new(:run_features) do |t|
          t.cucumber_opts = "--format json -o report/#{os_path}/#{browser_path}/cucumber.json --format html -o report/#{os_path}/#{browser_path}/cucumber.html"
        end

        Rake::Task[:run_features].execute()
    end
  end
end

task :default => [:cucumber ]