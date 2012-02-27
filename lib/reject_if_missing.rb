module RejectIfMissing
  def missing_attrs?(*required_attrs)
    Proc.new{ |attrs| required_attrs.all{|a| attrs[a].blank?}}
  end
end

ActiveRecord::Base.send(RejectIfMissing)

