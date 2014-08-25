module Paginate

  def custom_display
    page = 1

    Resource.limit(10).offset(page * 10) do |relation_of_term|
      puts relation_of_term
    end
    
  end

end
