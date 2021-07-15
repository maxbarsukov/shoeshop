class ProductSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :short_title,
             :bytitle,
             :content,
             :price,
             :old_price,
             :description

  belongs_to :category

  def short_title
    object.title.truncate(8)
  end
end
