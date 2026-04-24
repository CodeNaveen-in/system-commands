{ word[$1]++
}

END{
	max=0
	for(i in word){
		if(word[i]>max){
			freq=i
			max=word[i]
		}
	}
	print "Frequent word:", freq, "with count", max
}
