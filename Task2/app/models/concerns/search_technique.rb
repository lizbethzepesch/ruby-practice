module SearchTechnique
  extend ActiveSupport::Concern

  module ClassMethods
    def search(param)
      if param
        self.where(["title LIKE ?","%#{param}%"])
      else
        self.all
      end
    end
  end
end
