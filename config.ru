require 'rubygems'
require 'sinatra'
$: << File.dirname(__FILE__) + '/lib/'
require 'app'
run Nagira
