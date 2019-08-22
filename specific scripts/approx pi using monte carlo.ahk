


;~ InputBox, pointsTotal, Monte Carlo Integration, `nEnter the number of points to drop randomly. As the no. of points tends to infinity`, the error in the value of pi tends to zero(points > 200`,000 maybe CPU intensive).

pointsTotal := "10000"
pointsInside := "0"
distance := ""
Loop, % pointsTotal
{
	; specify points in min & max to genrate random floating number instead of integers
	Random, X, 0.0, 1.0
	Random, Y, 0.0, 1.0

	; format cuz the default output from above random syntax will be 6 decimals places long and we dont want that as the calculation can be CPU intensive
	;~ X := Format("{:0.1f}", X)
	;~ Y := Format("{:0.1f}", Y)
	
	distance := Sqrt(Abs((X - 0.5) ** 2 + (Y - 0.5) ** 2)) ; abs cuz value might be negative
	
	if (distance <= 0.5) ; if distance betn random x and y co-ordinate < radius point lies inside
		pointsInside += 1
	
	;~ pointsTotal := A_Index ; cuz A_index is 0 outside of loop
}

pi := 4 * (pointsInside / pointsTotal)

MsgBox % "With " pointsTotal " points the value of pi is approx. as `n`n" pi