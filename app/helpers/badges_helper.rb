module BadgesHelper
  def badge_image(badge)
    if badge.image_file.present?
      badge.image_file
    else
      asset_path 'award.jpg'
    end
  end
end
