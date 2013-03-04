# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Year.create(:default => 'false')
Year.create(:year => '2013', :default => 't')

User.create( :account => 'suuadmin',
             :username => 'suu 管理者', 
             :studentid => 99999999, 
             :email => 'suu@ep.sci.hokudai.ac.jp', 
             :role_id => 2,
             :grade => 'S1',
             :password_digest => '$2a$10$r3puseX3JSrxEaMDiCPB7.2Gn/DVRLhxG6DcaEkz75feMvoP.ouiu',
             :year => 2013,
             :machine => 'joho99',
             :acception => 't',
             :owner => 'suuadmin'
             )

Role.create do |u| 
  u.position = 'Staff'
end
Role.create do |u| 
  u.position = 'VTA'
end
Role.create do |u| 
  u.position = 'TA'
end
Role.create do |u|
  u.position = '受講生'
end
