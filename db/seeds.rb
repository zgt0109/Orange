# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Create System Position"
[
  "客服", "司机", "营业员", "服务员",
  "文员", "普工", "导购员", "保安",
  "理货员", "保洁", "保姆", "库管",
  "快递员", "足疗师", "发型师", "汽车修理"
].each do |position|
  Position.create(name: position, state: :confirmed)
end

puts "Create Enterprise User"
ent = Enterprise.new(email:'ent_01@10000zhi.cn', password: 'password')
["Rail工程师", "私人助理", "健身教练"].each do |position|
    ent.positions.build(name: position)
end
ent.save

puts "Create Admin user"
Admin.create(email:'adm_01@10000zhi.cn', password: 'password')
