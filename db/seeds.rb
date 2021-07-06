# frozen_string_literal: true

require 'faker'

brand_attributes = [{
                      title: 'Ecco', bytitle: 'ecco',
                      img: 'ecco.jpg', description: Faker::Superhero.name
                    },
                    {
                      title: 'Geox', bytitle: 'geox', img: 'geox.jpg',
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
