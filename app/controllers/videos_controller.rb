class VideosController < ApplicationController

	def index
		@videos = Video.all
	end

	def new
		@video = Video.new
	end

	def create
		@video = Video.new(video_params)

		if @video.save
			redirect_to @video
		else
			render 'new'
		end
	end
    
    def destroy
    	@video = Video.find(params[:id])
    	@video.destroy
	    respond_to do |format|
	      format.html { redirect_to videos_url, notice: 'Video was successfully deleted.' }
	      format.json { head :no_content }
	    end
	end

	def show
		@video = Video.find(params[:id])
		puts @video
	end

	def edit
		@video = Video.find(params[:id])	
	end

	def update
		@video = Video.find(params[:id])	
		@video.save
		redirect_to @video
	end

	private
  		def video_params
    		params.require(:video).permit(:title, :url, :comment)
  		end
end
