module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def inclination(number, enot, enota, enotov)
    return "" if number.nil? || !number.is_a?(Numeric)

    ostatok = number % 10
    ostatok_100 = number % 100

    enotov if (11..14).include?(ostatok_100)

    enot if ostatok == 1

    enota if (2..4).include?(ostatok)

    enotov if  ostatok >= 5 || ostatok == 0
  end
end
