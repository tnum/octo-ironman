module paginate

  def custom_array
    page = 0
    term_array = []

    Resource.limit(10).offset(page * 10) do |relation_of_term|
      term_array << relation_of_term
    end

    puts term_array
    
  end

end
