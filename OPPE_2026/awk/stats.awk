{
	if($1==1){
		sum_1++
	}
	if ($1==0){
		sum_0++
	}

}
END{
	if(sum_1>sum_0){
		print "not"
	} else{
	print "naught"
	}
}
