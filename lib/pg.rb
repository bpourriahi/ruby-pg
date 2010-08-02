#!/usr/bin/env ruby

require 'pathname'
require 'rbconfig'

# Load the correct version if it's a Windows binary gem
if RUBY_PLATFORM =~/(mswin|mingw)/i
	major_minor = RUBY_VERSION[ /^(\d+\.\d+)/ ] or
		raise "Oops, can't extract the major/minor version from #{RUBY_VERSION.dump}"
	require "#{major_minor}/pg_ext"
else
	archlib = Pathname( __FILE__ ).dirname + Config::CONFIG['arch']
	requirepath = archlib + 'pg_ext'
	require( requirepath.to_s )
end

