module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def inclination(number, enot, enota, enotov)
    return 'нет заданных вопросов' if number == 0

    remainder_over100 = number % 100

    return enotov if remainder_over100.between?(11, 14)

    remainder = number % 10

    return enot if remainder == 1

    return enota if remainder.between?(2, 4)

    enotov if remainder.between?(5, 9)
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
