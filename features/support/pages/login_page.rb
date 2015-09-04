class LoginPage
	include PageObject

	##elements###
	text_field(:username, :id => 'name')
	text_field(:password, :id => 'password')
	button(:login, :value => 'Login')

	def login_to_system(username = FigNewton.admin.username, password = FigNewton.admin.password)
		self.username = username
		self.password = password
		login
	end


end