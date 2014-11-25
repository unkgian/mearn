# coding: utf-8

require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:payment_1) { create(:payment_1) }
  describe 'GET index' do
    before do
      get(:index)
    end

    describe 'response' do
      subject { response }
      it { is_expected.to have_http_status(:success) }
      it { is_expected.to render_template(:index) }
    end

    describe '@payments' do
      subject { assigns(:payments) }
      it { is_expected.to match_array({}) }
    end
  end

  it { is_expected.to permit(:pay_date, :payment_kind_id, :allowance).for(:create) }

  describe 'GET new' do
    before do
      get(:new)
    end

    describe 'response' do
      subject { response }
      it { is_expected.to have_http_status(:success) }
      it { is_expected.to render_template(:new) }
    end

    describe '@payments' do
      subject { assigns(:payment) }
      it { is_expected.to be_a_new(Payment) }
    end
  end

  describe 'POST create' do
    context 'valid params' do
      let(:valid_params) {
        {
          'pay_date(1i)' => '2014',
          'pay_date(2i)' => '11',
          'pay_date(3i)' => '10',
          :payment_kind_id => 1,
          :allowance => 10000
        }
      }
      before do
        post(:create, { payment: valid_params })
      end

      describe 'response' do
        subject { response }
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(action: :index) }
      end

      describe 'Payment.count' do
        subject { lambda { post(:create, { payment: valid_params }) } }
        it { is_expected.to change(Payment, :count).by(1) }
      end

      describe '@payment' do
        subject { assigns(:payment) }
        it { is_expected.to be_a(Payment) }
      end
    end

    context 'invalid params' do
      let(:invalid_params) { {} }
      before do
        post(:create, { payment: invalid_params })
      end

      describe 'response' do
        subject { response }
        it { is_expected.to have_http_status(:success) }
        it { is_expected.to render_template(:new) }
      end

      describe 'flash[:alert]' do
        subject { flash[:alert] }
        it { is_expected.to eq 'なんかちゃうでー' }
      end
    end
  end

  describe 'GET edit' do
    before do
      get(:edit, { id: payment_1.id })
    end

    describe 'response' do
      subject { response }
      it { is_expected.to have_http_status(:success) }
      it { is_expected.to render_template(:edit) }
    end

    describe '@payment' do
      subject { assigns(:payment) }
      it { is_expected.to match(payment_1) }
    end
  end

  describe 'POST update' do
    context 'valid params' do
      let(:valid_params) {
        {
          'pay_date(1i)' => '2014',
          'pay_date(2i)' => '11',
          'pay_date(3i)' => '10',
          :payment_kind_id => 1,
          :allowance => 10000
        }
      }
      before do
        post(:update, { id: payment_1.id, payment: valid_params })
      end

      describe 'response' do
        subject { response }
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(action: :index) }
      end

      describe '@payment' do
        subject { assigns(:payment) }
        it { is_expected.to match(payment_1) }
      end
    end

    context 'invalid params' do
      before do
        post(:update, { id: -1 })
      end

      describe 'response' do
        subject { response }
        it { is_expected.to have_http_status(:success) }
        it { is_expected.to render_template(:edit) }
      end

      describe 'flash[:alert]' do
        subject { flash[:alert] }
        it { is_expected.to eq 'なんかちゃうでー' }
      end
    end
  end
end