module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def inclination(number, enot, enota, enotov)
    number = 0 if number == nil

    remainder_over100 = number % 100

    return "#{number} #{enotov}" if remainder_over100.between?(11, 14)

    remainder = number % 10

    return "#{number} #{enot}" if remainder == 1

    return "#{number} #{enota}" if remainder.between?(2, 4)

    "#{number} #{enotov}" if remainder.between?(5, 9)
  end
end
