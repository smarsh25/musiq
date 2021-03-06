class SitesController < ApplicationController
  include SitesHelper

  before_filter :check_admin, only: [:player, :play_next]

	# controls the music queues (listener and player)

	# home/index page GET, landing page
	def index
  	# if there is a title to search for, get search results to display
  	# NOTE this route/page can be arrived at from clicking search button on same page
  	# or clicking the home link (which does not provide a title param)
    @search_result_list = []
    unless params[:title].nil?
    	search_title = params[:title]
    	search_for_songs(search_title, @search_result_list)
    end
	end

	# GET display player page
	def player
		# locate now-playing track
		now_playing_track = Track.find_by(status: 'now playing')
		now_playing_track.nil? ? @current_track_video_id = "Q98_0Af8tG8" : @current_track_video_id = now_playing_track.video_id

		#show remaining tracks to play
		@tracks = Track.where(status: 'waiting').order('created_at')
	end

	# POST this method sets now playing track, to next track in the q, and removes from q
	def play_next
		# locate now-playing and next-playing tracks
		now_playing_track = Track.find_by(status: 'now playing')
		next_track = Track.where(status: 'waiting').order('created_at').first

		# remove now-playing track(s)
		unless now_playing_track.nil?
			# remove the users songs from users song list
			last_user_song = Song.find_by(title: now_playing_track.title, user_id: now_playing_track.user_id)
			last_user_song.destroy unless last_user_song.nil?

			# remove track from player list
			now_playing_track.destroy  # TODO, (tbd) may want to archive this, move to a play history
		end

		# check to make sure there is at least one song in q to play
		unless next_track.nil?
			# set now-playing track to next track in q
			next_track.update(status: 'now playing')

			# update the user's song status
			user_song = Song.find_by(title: next_track.title, user_id: next_track.user_id)
			user_song.update(status: 'now playing') unless user_song.nil?
    else
      flash[:error] = 'No music to play! Go gets some requests!'
		end

  	# redisplay player page
    redirect_to '/player'
	end

	# POSTs the results from adding a song to current user
  def add_song
  	# add this song to the users personal list (history)
    new_song = Song.create(title: params[:title], video_id: params[:video_id], status: "added to MusiQ!")
    current_user.songs << new_song

    # add this song to the player queue (tracks)
    Track.create(title: params[:title], video_id: params[:video_id], user_id: current_user.id, status: 'waiting')
    redirect_to root_url
  end

end

