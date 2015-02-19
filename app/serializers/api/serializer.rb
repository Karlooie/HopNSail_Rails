module Api
  class Serializer < ActiveModel::Serializer

    def serializable_hash(*)
      super()
    end

    # Serializes objects.
    #
    # obj - Either a single object or an Array of objects of the same type.
    #
    # Returns an Array of serialized objects.
    def self.serialize(objects, opts = {})
      Array(objects).map do |object|
        new object, opts
      end
    end

  end
end
