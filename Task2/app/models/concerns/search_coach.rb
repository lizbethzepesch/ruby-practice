module SearchCoach
  extend ActiveSupport::Concern

  module ClassMethods
    def search(param)
      if param
        self.where(["name LIKE ?","%#{param}%"])
      else
        self.all
      end
    end
  end
end
