require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    allow(Devise.mailer).to receive(:confirmation_instructions).and_return(
      double('Mailer', deliver: true)
    )
  end
  subject do
    @user = User.create(name: 'test', email: 'test@gmail.com', password: 'password')
    @group = @user.groups.new(name: 'food', icon: 'https://food.png')
  end

  it 'name should not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    expect(subject).to be_valid
  end

  it 'icon should be present' do
    expect(subject).to be_valid
  end

  it 'icon should not be blank' do
    subject.icon = ''
    expect(subject).to_not be_valid
  end
end
