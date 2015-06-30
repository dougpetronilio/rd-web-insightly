require 'rails_helper'

RSpec.describe "leads/index.html.erb", type: :view do
  it 'should display list leads' do
    douglas = Lead.new last_name: 'Douglas'
    teste = Lead.new last_name: 'Teste'
    assign(:leads, [douglas, teste])

    render

    expect(rendered).to match douglas.last_name
    expect(rendered).to match teste.last_name
  end
end
