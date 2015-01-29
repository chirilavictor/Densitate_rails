class DensitateController < ApplicationController
  def preluare_text
  end

  def afisare_rezultate
  	@text = params[:message].split

  	@nr_cuv = @text.length
  	@hash_cuv = @text.inject(Hash.new(0)) { |k,v| k[v] += 1; k }
  	@cuv_ord = @hash_cuv.sort_by { |k,v| v }.reverse
  	@nr_cuv_unice = @cuv_ord.length
  	@cuv_ord.each { |x| 	x[2] =(x[1] * 100.0 / @nr_cuv).to_f.round(4)  }

  	@expresii = []
		i = 0
		while @text[i+1] != nil
			@expresii[i] = @text[i] + " " + @text[i+1] 
			i += 1
		end
		@nr_expresii = @expresii.count
		@hash_expresii = @expresii.inject(Hash.new(0)) { |k,v| k[v] += 1; k }
		@expresii_ord = @hash_expresii.sort_by { |k,v| v }.reverse
		@nr_expresii_unice = @expresii_ord.count
		@expresii_ord.each { |x| 	x[2] = (x[1] * 100.0 / @nr_cuv).to_f.round(4)  }

		i = 0
		while i < @nr_cuv_unice
			@cuv_ord[i] << @expresii_ord[i][0] 
			@cuv_ord[i] << @expresii_ord[i][1] 
			@cuv_ord[i] << @expresii_ord[i][2]
		i += 1
		end 

  end

end
