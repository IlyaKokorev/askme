module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def inclination(number, enot, enota, enotov)
    if number == nil || !number.is_a?(Numeric)
      number = 0
    end

    remainder_over_100 = number % 100

    if remainder_over_100 >= 11 && remainder_over_100 <= 14
      return enotov
    end

    remainder = number % 10

    if remainder == 1
      enot
    end

    if remainder >= 2 && remainder <= 4
      enota
    end


    if (remainder >= 5 && remainder <= 9) || remainder == 0
      enotov
    end
  end
end
