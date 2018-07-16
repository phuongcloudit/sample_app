# frozen_string_literal: true

module UsersHelper
  def gravatar_for user, options = {size: Settings.gravatar_size}
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user.present?
    flash[:warning] = t ".not_found"
    redirect_to root_path
  end
end
