module.exports = -> funcs

funcs =
  bsn: ->
    Result1=""
    Nr9=Math.floor(Math.random()*7)
    Nr8=Math.floor(Math.random()*10)
    Nr7=Math.floor(Math.random()*10)
    Nr6=Math.floor(Math.random()*10)
    Nr5=Math.floor(Math.random()*10)
    Nr4=Math.floor(Math.random()*10)
    Nr3=Math.floor(Math.random()*10)
    Nr2=Math.floor(Math.random()*10)
    Nr1=0
    SofiNr=0
    if((Nr9==0)&&(Nr8==0)&&(Nr7==0)) then Nr8=1
    SofiNr=9*Nr9+8*Nr8+7*Nr7+6*Nr6+5*Nr5+4*Nr4+3*Nr3+2*Nr2
    Nr1=Math.floor(SofiNr-(Math.floor(SofiNr/11))*11)
    if Nr1 > 9
        if Nr2 > 0
            Nr2-=1
            Nr1=8
        else
            Nr2+=1
            Nr1=1

    Result1+=Nr9
    Result1+=Nr8
    Result1+=Nr7
    Result1+=Nr6
    Result1+=Nr5
    Result1+=Nr4
    Result1+=Nr3
    Result1+=Nr2
    Result1+=Nr1
    Result1