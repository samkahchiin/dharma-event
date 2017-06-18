# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
title = "《心经》与现代生活"
speaker = "继持法师"
description = "幸福人生最重要的条件是内心没有烦恼，没有烦恼时，不论什么情境中都容易开心；烦恼时，碰上再好的事也开心不起。智慧就是帮助我们解除烦恼的一种能力，认识及培养生命内在的自觉的力量是我们改变生命的唯一出路。
《心经》虽只有短短260个字，但涵义却非常丰富，是一部遇浅即浅，逢深则深的好经！把握一次与《心经》零距离接触的机会，学习观照生命的本质，掀开生命喜悦的篇章！"
contact = "叶志文 017-6776106"
location = "冼都斯里兰卡佛寺"
price = 40
5.times do |event|
  month = rand(12)
  area = Event::AREAS.sample
  language = Event::LANGUAGES.values.sample
  start_time = Date.new(2017, month, 27)
  end_time = Date.new(2017, month, 28)

  Event.create(title: title, start_time: start_time, end_time: end_time, speaker: speaker, description: description, contact: contact, location: location, price: price, area: area, language: language)
end
