# dept with highest salary

NR>1{
	dept=$3
	sal[dept]+=$4
	count[dept]++
}
END{
	max_avg=0
	for (i in sal){
		avg = sal[i]/count[i]
		if (avg>max_avg){
			max_avg = avg
			high_sal = i
		}
	}
	print "highest salary dept is", high_sal, "with salary of", max_avg
}
