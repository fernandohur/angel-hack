module StartupsHelper

	def hash_to_graph(hash)
		graph_data = "[" <<	"['startup', 'pageviews'],"
		index = 0
		hash.each do |k,v|
			if k && v && k>0 && v>0
				graph_data = graph_data << "['#{Startup.find(k).name}', #{v}],"
			end
			index = index + 1
		end
		graph_data << "['Other',0]]"
		return graph_data
	end

end
