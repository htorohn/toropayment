module Api
  module V1

    require 'active_merchant'

    class PaymentsController < ApplicationController
      before_action :set_payment, only: [:show, :update, :destroy]

      # GET /payments
      def index
        @payments = Payment.all

        render json: @payments
      end

      # GET /payments/1
      def show
        render json: @payment
      end

      # POST /payments
      def create
        @payment = Payment.new(payment_params)

        credit_card = ActiveMerchant::Billing::CreditCard.new(
          :number => payment_params[:ccNumber],
          :month => payment_params[:ccMonth],
          :year => payment_params[:ccYear],
          :first_name => payment_params[:first_name],
          :last_name => payment_params[:last_name],
          :verification_value => payment_params[:cvv] #verification codes are now required
          #:type => 'visa'
        )
        options = {
          :order_id => payment_params[:order_id],
          :billing_address => payment_params[:billingAddress],
          :email => payment_params[:email]
        }
        @payment[:ccNumber] = credit_card.display_number

        #print("\nValidation: ")
        #print(credit_card.validate)

        if credit_card.valid?
          gateway = ActiveMerchant::Billing::BacGateway.new(
           :keyid  => Settings.keyid,
           :hashkey => Settings.hashkey
          )
          #print("Tarjeta Valida")

          response = gateway.purchase(payment_params[:amount], credit_card, options)
          #put(@payment)
          #print(response)
          #response_params = response.params.serialize
          #print(response_params[:orderid])
          @payment_response = PaymentResponse.new(response.params)

           if @payment.save && @payment_response.save
            #render json: @payment, status: :created#, location: @payment
            #render json: @payment_response, status: :created#, location: @payment
            render json: response, status: :created
           else
          #  render json: @payment.errors, status: :unprocessable_entity
           end

        else
          #print("Tarjeta Invalida")
          #@request_error[:status] = "Tarjeta Invalida"
          render json: credit_card.validate, status: :non_authoritative_information
        end
        
      end

      # PATCH/PUT /payments/1
      def update
        if @payment.update(payment_params)
          render json: @payment
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /payments/1
      def destroy
        @payment.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_payment
          @payment = Payment.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def payment_params
          params.require(:payment).permit(:order_id, :ccNumber, :ccMonth, :ccYear, :cvv, :billingAddress, :description, :email, :amount, :first_name, :last_name)
        end
    end
  end
end
