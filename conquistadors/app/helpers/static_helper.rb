module StaticHelper

  def page_title
    [ "City States", 
      *@title
    ].compact.join(' - ')
     
  end

end
