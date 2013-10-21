require 'bundler'
Bundler.setup

require 'minitest/pride'
require 'minitest/spec'
require 'minitest/autorun'
require 'tmpdir'

$: << File.expand_path('../../lib', __FILE__)

require 'todo'
