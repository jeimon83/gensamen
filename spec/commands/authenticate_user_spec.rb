# frozen_string_literal: true

require 'rails_helper'

describe AuthenticateUser do
  describe '.call' do
    context 'when auth is successful' do
      #let(:email) { 'correct_email' } 
      #let(:password) { 'correct_password' }
      it 'succeeds' do
        #auth = { email: 'admin@gensamen.com.ar', password: '123qwe' }
        #email = auth[:email]
        #password = auth[:password]
        email = "admin@gensamen.com.ar"
        password = "123qwe"
        command = AuthenticateUser.new(email,password)
        expect(command.call).to be_success
      end
    end
    #context 'when the context is not successful' do
    #  let(:email) { 'wrong_email' }
    #  let(:password) { 'wrong_password' }
    #  it 'fails' do
    #    expect(context).to be_failure
    #  end
    #end
  end
end