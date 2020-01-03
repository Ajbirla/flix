module MoviesHelper
	def formate_total_gross(movie)
		if movie.flop?
			#"<strong>Flop</strong>".html_safe
			 content_tag(:strong, 'Flop!')
		else
			content_tag(:strong, 'Hit!')
		end
	end
	
	
	# def image_for(movie)
	# 		    if movie.image_file_name.blank?
 #      image_tag('placeholder.png')
 #    else
 #      image_tag(movie.image_file_name)
 #    end
 
			# img=movie.image_file_name
		# if File.exist?("Rails.root/'app'/'assets'/'images'/#{img}")
		# 	image_tag(movie.image_file_name)
		# else
		# 	image_tag 'placeholder.png'
		# end
	# end
end
