DIR_NAME = File.dirname(__FILE__)
Dir[File.join(DIR_NAME, "../lib/**/*.rb")].each { |f| require f }
require_relative '../exe/dir_hierachy_generator'
require 'test/unit'
require 'awesome_print'
require 'fakefs'
include DirHierarchyGenerator
