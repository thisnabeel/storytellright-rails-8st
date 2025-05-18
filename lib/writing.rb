module Writing
  def self.included(base)
  end

  def check_text?
    #stuff
    if self.present? && self != "<p><br></p>"
      return true
    else
      return false
    end
  end

end