class Club < ActiveRecord::Base

    
    serialize :members

    has_many :discussions
    before_save :save_slug

    def role(user, role)
        if !user.present?
            return false
        else
            check = false
            self.members.each do |member|
                puts member["email"]
                if (member["email"] == user.email) && member["role"] == "admin"
                    check = true
                end
            end
            return check
        end
    end

    def save_slug
        self.slug = self.title.parameterize
    end
end
