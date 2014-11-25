# coding: utf-8

# === PaymentsControllerクラス
class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.save!
    redirect_to(action: :index)
  rescue
    flash.now[:alert] = 'なんかちゃうでー'
    render(:new)
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    @payment.update(payment_params)
    redirect_to(action: :index)
  rescue
    flash.now[:alert] = 'なんかちゃうでー'
    render(:edit)
  end

  private

  def payment_params
    params.require(:payment).permit(:pay_date,
                                    :payment_kind_id,
                                    :allowance)
  end
end
