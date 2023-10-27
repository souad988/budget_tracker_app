require 'rails_helper'

RSpec.describe ExpenseTransaction, type: :model do
  before(:each) do
    allow(Devise.mailer).to receive(:confirmation_instructions).and_return(
      double('Mailer', deliver: true)
    )
  end
  subject do
    @user = User.create(name: 'test', email: 'test@gmail.com', password: 'password')
    @group = Group.create(name: 'food', icon: 'https://food.png', author: @user)
    @expense_transaction = ExpenseTransaction.create(author: @user, group: @group, name: 'food', amount: 100)
  end

  it 'name should not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    expect(subject).to be_valid
  end

  it 'amount should be present' do
    expect(subject).to be_valid
  end

  it 'amount should not be blank' do
    subject.amount = ''
    expect(subject).to_not be_valid
  end

  it 'amount should be greater than or equal to 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'author should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'group should be present' do
    subject.group = nil
    expect(subject).to_not be_valid
  end
end
