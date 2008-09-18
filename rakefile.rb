$:.unshift File.dirname(__FILE__)

require 'buildmaster/site'
require 'buildmaster/cotta'
require 'buildmaster/project/ftp_driver'
require 'rake'

dir = BuildMaster::Cotta.file(__FILE__).parent
SITE_SPEC = BuildMaster::SiteSpec.new(__FILE__) do |spec|
  spec.template_file = dir.file('content/template.html').path
  spec.content_dir = dir.dir('content').path
  spec.output_dir = dir.dir('output').path
end

task :default => [:clean, :build, :ftp]

task :clean do
  SITE_SPEC.output_dir.delete
end

task :build do
  BuildMaster::Site.new(SITE_SPEC).build
end

task :server do
  BuildMaster::Site.new(SITE_SPEC).server
end

task :ftp do
  require 'account' #This file is not checked in.
  puts "ftp to bayxp.org using #{USERNAME}"
  ftp = BuildMaster::FtpDriver.new('bayxp.org', USERNAME, PASSWORD)
  ftp.upload(SITE_SPEC.output_dir)
end
