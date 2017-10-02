class CodeController < ApplicationController
  def index
  	@code = Code.last
  	@codes = Code.all
  end

  def create
  	code = ''
  	while(code == '')
	  	firstNums = rand(0...99).to_s
	  	if firstNums.length == 1
	  		firstNums.insert(0,'0')
	  	end

	  	letters = ('A'..'Z').to_a.shuffle[0,2].join

	  	secondNums = rand(0...99).to_s
	  	if secondNums.length == 1
	  		secondNums.insert(0,'0')
	  	end

	  	code = (firstNums + letters + secondNums)
	  	if (Code.where(code: code).any? == false)
		  	Code.create(code: code)
	  		redirect_to root_path
	  	else
	  		code = ''
	  	end
	end
  end

end
