class PartiesController < ApplicationController

	def new
		@party = Party.new
	end

	def create
		party = Party.new(party_params)
		party.organizer_user_id = current_user.id
		if party.save!
			redirect_to new_party_path
		else
			redirect_to new_party_path ,notice: 'うまく保存されませんでした。お手数ですが、再度実行してください'
		end
	end


private
	def party_params
		params.require(:party).permit(:party_name, :event_date, :place, :content)
	end

end
