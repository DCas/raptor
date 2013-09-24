module PlayersHelper
  
  def smiley_color(sentiment)
    if sentiment > .25
      'green'
    else if sentiment < -.25
      'red'
    else
      'yellow'
    end
  end
  
end
