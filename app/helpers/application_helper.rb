module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def inclination(number, enot, enota, enotov)
    number = 0 if number == nil || !number.is_a?(Numeric)

    remainder_over_100 = number % 100

    return "#{number} #{enotov}" if remainder_over_100 >= 11 && remainder_over_100 <= 14

    remainder = number % 10

    return "#{number} #{enot}" if remainder == 1

    return "#{number} #{enota}" if remainder >= 2 && remainder <= 4

    return "#{number} #{enotov}" if (remainder >= 5 && remainder <= 9) || remainder == 0
  end
end
