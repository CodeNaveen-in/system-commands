NR>1{
	sum=0
	for(i=2;i<=NF;i++){
		sum+=$i
	}
	avg = sum/(NF-1)
	if(avg>max_sales){
		max_sales=avg
		highest=$1
	}
}
END{
	print "Highest Salesperson:", highest
}
