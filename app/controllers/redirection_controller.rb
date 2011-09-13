class RedirectionController < ApplicationController
  def index
     #Recupère lien courant correspondant au QRcode
	qrcode_id = params[:qrcode_id]
	puts "YYYYYYYYYYYY"+qrcode_id
	if !qrcode_id.nil?
	  t = Tag.find(:all,:conditions => ["data = ?",qrcode_id])
	  puts "TTTTTTTTT"+t[0].data
	end
	url = t[0].url
	puts "ZZZZZZZZZZZZZ"+url
	if !url.empty?
	  redirect_to url
	else
	  redirect_to 'tags/index'
	end

  end

end
