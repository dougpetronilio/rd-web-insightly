require 'rails_helper'

RSpec.describe "leads/edit.html.erb", type: :view do
  it 'should display lead' do
    douglas = Lead.new last_name: 'Douglas', name: 'Oliveira', email: 'dougpetronilio@gmail.com', job_title: 'Engineer', phone: '4399329292', website: 'www.google.com', company: 'Teste'
    assign(:lead, douglas)

    render

    expect(rendered).to match douglas.last_name
    expect(rendered).to match douglas.name
    expect(rendered).to match douglas.email
    expect(rendered).to match douglas.job_title
    expect(rendered).to match douglas.phone
    expect(rendered).to match douglas.website
    expect(rendered).to match douglas.company
  end
end
