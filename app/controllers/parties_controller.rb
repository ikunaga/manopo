class PartiesController < ApplicationController

	def new
		@party = Party.new
	end

	def create
		binding.pry
		party = Party.new(party_params)
		party.organizer_user_id = current_user.id
		if party.save!
			redirect_to new_party_path
		else
			redirect_to new_party_path ,notice: 'うまく保存されませんでした。お手数ですが、再度実行してください'
		end
	end

	def destroy
		party = Party.find(params[:id])
		party.destroy
		redirect_to parties_path
	end

	def show
		@party = Party.find(params[:id])
		@user_partyn = UserParty.new
	end

	def index
		@parties = Party.all
	end

	def edit
		@party = Party.find(params[:id])
	end

	def update
		party = Party.find(params[:id])
		party.update(party_params)
		redirect_to parties_path
	end


#中間テーブル
	def user_party_create
		@user_partyn = UserParty.new
		@user_partyn.user_id = current_user.id
		@user_partyn.party_id = params[:id]
		if @user_partyn.save
			redirect_to party_path
		else
			redirect_to party_path ,notice: 'うまく処理されませんでした。お手数ですが、再度実行してください'
		end
	end

	def user_party_destroy
        party = Party.find(params[:id])
        user_party = current_user.user_parties.find_by(party_id: party.id)
        user_party.destroy
        redirect_to party_path(party)
    end


private
	def party_params
		params.require(:party).permit(:party_name, :event_date, :place, :contents, :category_id, :organizer_user_id)
	end

end

