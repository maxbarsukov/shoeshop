# frozen_string_literal: true

require 'faker'

brand_attributes = [{
                      title: 'Ecco', bytitle: 'ecco',
                      img: 'ecco.jpg', description: Faker::Superhero.name
                    },
                    {
                      title: 'Gucci', bytitle: 'gucci', img: 'gucci.jpg',
                      description: Faker::Superhero.name
                    },
                    {
                      title: 'Hugo Boss', bytitle: 'hugo-boss',
                      img: 'hugo-boss.jpg', description: Faker::Superhero.name
                    },
                    {
                      title: 'Lacoste', bytitle: 'lacoste', img: 'lacoste.png',
                      description: Faker::Superhero.name
                    },
                    {
                      title: 'Prada', bytitle: 'prada', img: 'prada.png',
                      description: Faker::Superhero.name
                    }]

brand_attributes.each do |attr|
  Brand.create(attr) unless Brand.where(attr).first
end

product_attributes = [
  {
    brand_id: '2',
    title: 'Off The Grid high top Gucci Tennis 1977',
    bytitle: '628717 H9H80 1162',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'gucci tennis italy',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-1.png',
    hit: 1
  },
  {
    brand_id: '2',
    title: 'Matelassé sling back',
    bytitle: '659471 BKO00 4514',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'gucci matelasse italy',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-2.png',
    hit: 1
  },
  {
    brand_id: '2',
    title: 'Rhyton sneaker with cat eyes',
    bytitle: '663723 2SH00 9014',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'gucci sneaker italy',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-3.png',
    hit: 1
  },
  {
    brand_id: '3',
    title: 'Low-top trainers with thermo-bonded trim',
    bytitle: 'SATURN_LOWP_NYRS - 50452024',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'hugo boss trainers',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-4.png',
    hit: 1
  },
  {
    brand_id: '3',
    title: 'Italian-made Derby shoes in vegetable-tanned leather',
    bytitle: 'KENSINGTON_DERB_BU - 50385015',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'hugo boss leather shoes',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-5.png',
    hit: 1
  },
  {
    brand_id: '3',
    title: 'Rubber flip-flops with new-season logo',
    bytitle: 'PACIFIC_THNG_DIGITAL - 50428976',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'hugo boss flip-flops',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-6.png',
    hit: 1
  },
  {
    brand_id: '4',
    title: 'CROCO SLIDE 0721 1 CMA',
    bytitle: '741CMA0007-042',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'lacoste croco',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-7.png',
    hit: 1
  },
  {
    brand_id: '4',
    title: 'SURUGA 120 1 CFA',
    bytitle: '739CFA0005-95K',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'lacoste suruga',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-8.png',
    hit: 1
  },
  {
    brand_id: '4',
    title: 'Sneakers LACOSTE',
    bytitle: '741SUC0013-J18',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'lacoste sneakers',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-9.png',
    hit: 1
  },
  {
    brand_id: '5',
    title: 'Polished leather loafers',
    bytitle: '1D246M_055_F0002_F_B050',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'prada loafers',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-10.png',
    hit: 1
  },
  {
    brand_id: '5',
    title: 'Polished leather derby shoes',
    bytitle: '2EG312_B4L_F0D56',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'prada derby shoes',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-11.png',
    hit: 1
  },
  {
    brand_id: '5',
    title: 'Slip-ons made of technical nylon',
    bytitle: '4D3488_71L_F0632',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'prada slip-ons',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-12.png',
    hit: 1
  },
  {
    brand_id: '1',
    title: 'ECCO DEVINE MOC moccasins',
    bytitle: '370843-02001',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'ecco moccasins',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-13.png',
    hit: 1
  },
  {
    brand_id: '1',
    title: 'ECCO IFLA clogs',
    bytitle: '291603-01001',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'ecco clogs',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-14.png',
    hit: 1
  },
  {
    brand_id: '1',
    title: 'ECCO SP.1 LITE sneakers',
    bytitle: '712642-01303',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'ecco sneakers',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-15.png',
    hit: 1
  },
  {
    brand_id: '1',
    title: 'ECCO MULTI-VENT sneakers',
    bytitle: '880124-01007',
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    old_price: Faker::Commerce.price,
    status: 1,
    keywords: 'ecco sneakers',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'p-16.png',
    hit: 1
  }
]

product_attributes.each do |attr|
  Product.create(attr) unless Product.where(attr).first
end
