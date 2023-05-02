class UsersController < ApplicationController
  def lock_transaction
    payment = Payment.first

    payment.with_lock do
      # if payment.amount == 0
      #  render json: { message: '予約枠はありません', data: { amount: payment.amount } }, status: :bad_request
      #  return
      # end

      payment.amount -= 1
      payment.save!
      sleep(8)
    end

    render json: { message: '予約完了', data: { amount: payment.amount } }, status: :ok
  end

  def not_lock_transaction 
    payment = Payment.first

    Payment.transaction do
      sleep(8)
      if payment.amount == 0
       render json: { message: '予約枠はありません', data: { amount: payment.amount } }, status: :bad_request
       return
      end

      payment.amount -= 1
      payment.save!
    end

    render json: { message: '予約完了', data: { amount: payment.amount } }, status: :ok
  end
end
