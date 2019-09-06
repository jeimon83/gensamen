# frozen_string_literal: true

require 'rails_helper'

describe AuthenticateUser do
  subject(:context) { described_class.call(email, password) }

  describe '.call' do
    context 'when the context is successful' do
      let(:email) { 'admin@clinicaolivos.com.ar' }
      let(:password) { '123qwe' }

      it 'succeeds' do
        expect(context).to be_success
      end
    end

    context 'when the context is not successful' do
      let(:email) { 'wrong_email' }
      let(:password) { 'wrong_password' }

      it 'fails' do
        expect(context).to be_failure
      end
    end
  end
end