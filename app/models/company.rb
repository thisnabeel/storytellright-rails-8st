class Company < ActiveRecord::Base
    has_many :company_users, dependent: :destroy
    has_many :users, through: :company_users
    has_many :productions, dependent: :destroy

    belongs_to :user
    
    after_create :init_user
    after_create :update_code
    
    def init_user
        CompanyUser.create(company_id: self.id, user_id: self.user_id)
    end

    after_create :update_code

    def update_code
        if self.code.present?
            return self.code
        else
            new_code = generate_code
            self.update(code: new_code)
            return new_code
        end
    end

    private
    def generate_code
        code = rand(36**8).to_s(36)
        while Company.find_by_code(code).present? == true
          code = rand(36**8).to_s(36)
        end
        return code
    end
end
