BEGIN{
    min=100
}
NR>1{
    sum=0
    for (i=2; i<=NF; i++){
        sum+=$i
    }
    avg=sum/(NF-1)
    if(avg<min){
        min=avg
        lowest=$1
    }
}
END{
    print "lowest:", lowest
}