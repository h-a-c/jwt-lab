module ApplicationHelper
	def fullTitle(page_title = '')
		base_title = 'TokenLab : JWTLabs'
		if page_title.empty?
			base_title
		else
			'TokenLab ' + page_title + ' : JWTLabs'
		end
	end
end
