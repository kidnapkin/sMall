module ReviewsHelper
    
  def show_stars(product)
    average_rating = product.reviews.published.any? ? product.reviews.published.average(:rating) * 20 : 0

    raw("<div class='star-ratings-sprite'>" +
        "<span style='width: #{average_rating.to_i}%' class='star-ratings-sprite-rating'>" +
        "</span>" +
        "</div>")
  end
  
  def show_review_stars(review)
    review_rating = review.published ? review.rating * 20 : 0

    raw("<div class='star-ratings-sprite'>" +
        "<span style='width: #{review_rating.to_i}%' class='star-ratings-sprite-rating'>" +
        "</span>" +
        "</div>")
  end
end
