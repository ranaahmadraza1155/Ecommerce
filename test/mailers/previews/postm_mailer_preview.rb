# Preview all emails at http://localhost:3000/rails/mailers/postm_mailer
class PostmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/postm_mailer/post_created
  def post_created
    PostmMailer.post_created
  end

end
