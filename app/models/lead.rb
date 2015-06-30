class Lead < RdInsightly::Lead
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include RdInsightly

  def initialize(attributes = {})
    return super('', {}) if attributes[:last_name].nil?
    super(attributes[:last_name], attributes)
  end

  def persisted?
    !self.id.nil? 
  end
end
