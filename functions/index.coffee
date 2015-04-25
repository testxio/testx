rnd = (n) -> Math.floor(Math.random() * n)

module.exports = ->
  generateElevenProof: ->
    nr = [0, 0, rnd(10), rnd(10), rnd(10), rnd(10), rnd(10), rnd(10), rnd(10), rnd(7)]
    if (nr[9] == 0) && (nr[8] == 0) && (nr[7] == 0) then nr[8] = 1
    nr[0] = (nr[i] * i for i in [2..9]).reduce (l, r) -> l + r
    nr[1] = Math.floor(nr[0] - (Math.floor(nr[0] / 11)) * 11)
    if nr[1] > 9
      if nr[2] > 0
        nr[2]-=1
        nr[1]=8
      else
        nr[2]+=1
        nr[1]=[1]

    nr[1..9].reverse().join('')
