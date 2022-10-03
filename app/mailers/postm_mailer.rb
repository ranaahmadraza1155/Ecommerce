class PostmMailer < ApplicationMailer
  default from: 'appstore@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.postm_mailer.post_created.subject
  #
  def post_created
    @order = params[:order]
        @url  = 'http://example.com/login'
        mail(to: "reliableisrar@gmail.com", subject: 'Order is created')
  end
end
