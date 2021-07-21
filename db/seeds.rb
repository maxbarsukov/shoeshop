# frozen_string_literal: true

require 'faker'


# Brands

ecco      = Brand.create!(title: 'Ecco', bytitle: 'ecco', img: 'ecco.jpg',
                          description: Faker::Superhero.name)
gucci     = Brand.create!(title: 'Gucci', bytitle: 'gucci', img: 'gucci.jpg',
                          description: Faker::Superhero.name)
hugo_boss = Brand.create!(title: 'Hugo Boss', bytitle: 'hugo-boss',img: 'hugo-boss.jpg',
                          description: Faker::Superhero.name)
lacoste   = Brand.create!(title: 'Lacoste', bytitle: 'lacoste', img: 'lacoste.jpg',
                          description: Faker::Superhero.name)
prada     = Brand.create!(title: 'Prada', bytitle: 'prada', img: 'prada.jpg',
                          description: Faker::Superhero.name)


# Categories

men = Category.create!(title: 'Men', bytitle: 'men', keywords: 'men', description: 'for men')
women = Category.create!(title: 'Women', bytitle: 'women', keywords: 'women', description: 'for women')
kids = Category.create!(title: 'Kids', bytitle: 'kids', keywords: 'kids', description: 'for kids')

sling = Category.create!(title: 'Sling', bytitle: 'sling', keywords: 'sling', description: 'sling', parent: women)
slipons = Category.create!(title: 'Slipons', bytitle: 'slipons', keywords: 'slipons', description: 'slipons', parent: women)

flipflops = Category.create!(title: 'Flipflops', bytitle: 'flipflops', keywords: 'flipflops', description: 'flipflops', parent: slipons)
highheels = Category.create!(title: 'Highheels', bytitle: 'highheels', keywords: 'highheels', description: 'highheels', parent: sling)

loafers = Category.create!(title: 'Loafers', bytitle: 'loafers', keywords: 'loafers', description: 'loafers', parent: men)
sneakers = Category.create!(title: 'Sneakers', bytitle: 'sneakers', keywords: 'sneakers', description: 'sneakers', parent: men)
convers = Category.create!(title: 'Convers', bytitle: 'convers', keywords: 'convers', description: 'convers', parent: sneakers)

derby = Category.create!(title: 'Derby', bytitle: 'derby', keywords: 'derby', description: 'derby', parent: loafers)
business = Category.create!(title: 'Business', bytitle: 'business', keywords: 'business', description: 'business', parent: loafers)

clogs = Category.create!(title: 'Clogs', bytitle: 'clogs', keywords: 'clogs', description: 'clogs', parent: kids)
crocs = Category.create!(title: 'Crocs', bytitle: 'crocs', keywords: 'crocs', description: 'crocs', parent: kids)


# Products

product_attributes = [
  {
    data: {
      category: sneakers,
      brand: gucci,
      title: 'GUCCI Tennis',
      bytitle: '628717-H9H80-1162',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'gucci tennis italy',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-1.png',
      hit: 1
    },
    tags: {
      category_list: sneakers.title,
      brand_list: gucci.title
    }
  },
  {
    data: {
      category: highheels,
      brand: gucci,
      title: 'GUCCI sling',
      bytitle: '659471-BKO00-4514',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'gucci matelasse italy',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-2.png',
      hit: 1
    },
    tags: {
      category_list: highheels.title,
      brand_list: gucci.title
    }
  },
  {
    data: {
      category: sneakers,
      brand: gucci,
      title: 'GUCCI Sneakers',
      bytitle: '663723-2SH00-9014',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'gucci sneaker italy',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-3.jpg',
      hit: 1
    },
    tags: {
      category_list: sneakers.title,
      brand_list: gucci.title
    }
  },
  {
    data: {
      category: convers,
      brand: hugo_boss,
      title: 'HUGO BOSS trainers',
      bytitle: 'SATURN_LOWP_NYRS-50452024',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'hugo boss trainers',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-4.jpg',
      hit: 1
    },
    tags: {
      category_list: convers.title,
      brand_list: hugo_boss.title
    }
  },
  {
    data: {
      category: derby,
      brand: hugo_boss,
      title: 'HUGO BOSS Derby',
      bytitle: 'KENSINGTON_DERB_BU-50385015',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'hugo boss leather shoes',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-5.jpg',
      hit: 1
    },
    tags: {
      category_list: derby.title,
      brand_list: hugo_boss.title
    }
  },
  {
    data: {
      category: flipflops,
      brand: hugo_boss,
      title: 'HUGO BOSS Flip-flops',
      bytitle: 'PACIFIC_THNG_DIGITAL-50428976',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'hugo boss flip-flops',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-6.png',
      hit: 1
    },
    tags: {
      category_list: flipflops.title,
      brand_list: hugo_boss.title
    }
  },
  {
    data: {
      category: crocs,
      brand: lacoste,
      title: 'LACOSTE Croco',
      bytitle: '741CMA0007-042',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'lacoste croco',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-7.jpg',
      hit: 1
    },
    tags: {
      category_list: crocs.title,
      brand_list: lacoste.title
    }
  },
  {
    data: {
      category: clogs,
      brand: lacoste,
      title: 'LACOSTE Suruga',
      bytitle: '739CFA0005-95K',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'lacoste suruga',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-8.jpg',
      hit: 0
    },
    tags: {
      category_list: clogs.title,
      brand_list: lacoste.title
    }
  },
  {
    data: {
      category: sneakers,
      brand: lacoste,
      title: 'LACOSTE Sneakers',
      bytitle: '741SUC0013-J18',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'lacoste sneakers',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-9.jpg',
      hit: 1
    },
    tags: {
      category_list: sneakers.title,
      brand_list: lacoste.title
    }
  },
  {
    data: {
      category: loafers,
      brand: prada,
      title: 'PRADA Loafers',
      bytitle: '1D246M_055_F0002_F_B050',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'prada loafers',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-10.jpg',
      hit: 1
    },
    tags: {
      category_list: loafers.title,
      brand_list: prada.title
    }
  },
  {
    data: {
      category: sling,
      brand: prada,
      title: 'PRADA Shoes',
      bytitle: '2EG312_B4L_F0D56',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'prada derby shoes',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-11.jpg',
      hit: 0
    },
    tags: {
      category_list: sling.title,
      brand_list: prada.title
    }
  },
  {
    data: {
      category: slipons,
      brand: prada,
      title: 'PRADA Slip-ons',
      bytitle: '4D3488_71L_F0632',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'prada slip-ons',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-12.jpg',
      hit: 1
    },
    tags: {
      category_list: slipons.title,
      brand_list: prada.title
    }
  },
  {
    data: {
      category: business,
      brand: ecco,
      title: 'ECCO Moccasins',
      bytitle: '370843-02001',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'ecco moccasins',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-13.jpg',
      hit: 0
    },
    tags: {
      category_list: business.title,
      brand_list: ecco.title
    }
  },
  {
    data: {
      category: clogs,
      brand: ecco,
      title: 'ECCO Clogs',
      bytitle: '291603-01001',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'ecco clogs',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-14.jpg',
      hit: 1
    },
    tags: {
      category_list: clogs.title,
      brand_list: ecco.title
    }
  },
  {
    data: {
      category: sneakers,
      brand: ecco,
      title: 'ECCO Sneakers',
      bytitle: '712642-01303',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'ecco sneakers',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-15.jpg',
      hit: 1
    },
    tags: {
      category_list: sneakers.title,
      brand_list: ecco.title
    }
  },
  {
    data: {
      category: convers,
      brand: ecco,
      title: 'ECCO CMA',
      bytitle: '880124-01007',
      content: Faker::Lorem.sentence(word_count: 20),
      price: Faker::Commerce.price(range: 20.0...50.0),
      old_price: Faker::Commerce.price(range: 50.0..400.0),
      status: 1,
      keywords: 'ecco sneakers',
      description: Faker::Lorem.sentence(word_count: 10),
      img: 'p-16.jpg',
      hit: 0
    },
    tags: {
      category_list: convers.title,
      brand_list: ecco.title
    }
  }
]

product_attributes.each do |attr|
  product = Product.create(attr[:data]) unless Product.where(attr[:data]).first
  product.category_list.add(attr[:tags][:category_list])
  product.brand_list.add(attr[:tags][:brand_list])
  product.save!
end

connection = ActiveRecord::Base.connection()

sql = <<-EOL
  INSERT INTO related_products
  (product_id, related_id)
  VALUES
  (1, 9), (1, 8), (1, 7),
  (2, 6), (2, 5), (2, 4),
  (3, 1), (3, 2), (3, 4),
  (4, 1), (4, 2), (4, 3),
  (5, 3), (5, 8), (5, 7),
  (6, 4), (6, 1), (6, 2),
  (7, 9), (7, 8), (7, 3),
  (8, 4), (8, 6), (8, 2),
  (9, 4), (9, 1), (9, 2);

  INSERT INTO galleries
  (id, product_id, img)
  VALUES
  (1, 2, 'p-2.png'),
  (2, 2, 's-2.jpg'),
  (3, 2, 's-3.jpg')
EOL

sql.split(';').each do |s|
  connection.execute(s.strip) unless s.strip.empty?
end
