
TITLE My First Program (Text.asm)
INCLUDE Irvine32.inc
.data
			;; 1- msg for the procedure of Newton_Law
	Pmsg1 byte "Find the value of force if the value of m and a are: ",0

			;; 2- msg for the procedure of Kinetic_Energy
	Pmsg4 byte "Find the value of Kinetic Energy if the value of mass and velocity are: ",0

			;; 3- msg for the procedure of Centripetal_Acceleration
	Pmsg5 byte "Find the value of Centripetal Acceleration if the value of velocity and radius are: ",0
			
			;; 4- msg for the procedure of Current
	Pmsg6 byte "Find the value of Current if the value of charge and time is: ",0
	
			;; 5- msg for the procedure of Torque
	Pmsg7 byte "Find the value of torque if the value of Force and displacement are: ",0
	
			;; 6- msg for the procedure of velocity
	Pmsg8 byte "Find the value of velocity if the value of displacement and time are: ",0
	
			;; 7- msg for the procedure of distance
	Pmsg9 byte "Find the value of distance if the value of velocity and time are: ",0
	
			;; 8- msg for the procedure of angular velocity 
	Pmsg10 byte "Find the value of angular velocity if the value of linear velocity and radius are: ",0
	
			;; 9- msg for the procedure of speed of wave	 
	Pmsg11 byte "Find the value for the speed if the value of velocity and frequency are: ",0

			;; 10- msg for the proecudue of frequency and time period
	Pmsg12 byte "Find the value of frequency if the value of velocity and lambda is: ",0

			;; 11- msg for the procedure of linear momentum
	Pmsg13 byte "Find the value of linear momentum if the value of mass and velocity is: ",0
			
				;; all variables
	Mean byte 13 DUP (?)		;; variable for mean
	valY byte ?
	valM byte ?
	valC byte ?
	Median1 byte 25 DUP (?)
	ModeArr byte 15 DUP (?)
	FreqMode byte 10 DUP (?)
	divTerm byte 10
	max byte ?
	index dword ?
	Summation byte 15 DUP (?)

		;; 1- msgs for median procedure
	Smsg1 byte "Calculate the median of the following sequence: ",0

		;; 2- msgs for mean procedure
	Smsg2 byte "Calculate the mean of the following sequence: ",0

		;; 3- msgs for interpolating procedure
	Smsg3 byte "Calculate the slope of the following equation: ",0
	Smsg3i byte "Y= ",0
	Smsg3ii byte "X + ",0

		;; 4- msgs for mode procedure
	Smsg4 byte "Calculate the mode of the following procedure: ",0

		;; 5- msgs for summation procedure
	Smsg5 byte "Calculate the sum value of: ",0


	msg byte " ",0
	msg1 byte ",",0
	msg2 byte "____",0
			;; variable for all procedures
	valAcc byte ?				;; Acceleration
	valForce byte ?				;; Force
	valMass byte ?				;; Mass
	valVelocity byte ?			;; Velocity
	valRadius byte ?			;; Radius
	valCharge byte ?			;; Charge
	valTime byte ?				;; Time
	valDisplacement byte ?		;; Displacement
	valFrequency byte ?			;; Frequency
	valLambda byte ?				;; Lambda
	valMultiplier byte 2

	PalindromicNumber byte ?
	PalindromicNumberReverse byte ?
	mulTerm1 byte 10
	mulTerm2 byte 100
	mulTerm3 byte 3
	Series byte 15 DUP (?)
	First_Term byte ?
	Common_Diff byte ?
	GFirst_Term word ?
	GCommon_Diff word ?
	GSeries word 6 DUP (?)
	CompositeNumber byte ?
	temp byte ?
	FirstNumber byte ?
	SecondNumber byte ?
	ValSquareFree word ?
	valSquare byte ?

			;; 1-> Msg for Arithmetic Series and Geometric Series
	Mmsg1 byte "Identify the next number in the following series: ",0

			;; 2-> Msg for Palindromic Number Procedure
	Mmsg2 byte "Identify if the given number is palindromic or not: ",0

			;; 3-> Msg for triangle Number
	Mmsg3 byte "Consider a triangle number of length: ",0

			;; 4-> Msg for Composite Number
	Mmsg4 byte "Identify if the number is composite or not: ",0

			;; 5-> Msg for pentagonal number 
	Mmsg5 byte "Find the pentagonal number of the given length: ",0
		
			;; 6-> Msg for Relatively Prime number
	Mmsg6 byte "Find if the two numbers are relativey Prime Or Not: ",0

			;; 7-> Msg for checking if the given number is Square Free or Not
	Mmsg7 byte "Identify if the given number is Square Free or Not: ",0

			;; 8-> Msg for cube number
	Mmsg8 byte "Identify the cube of given number: ",0

			;; 9-> Msg for square number
	Mmsg9 byte "Identify the square of the following number : ",0

			;; variables for options
	CorrectAnswer word ?
	OtherOptions word 3 DUP (?)
	Total_Score byte ?
	stime dword ?
			;; msgs for displaying answers
	Options1 byte "a)   ",0
	Options2 byte "b)   ",0
	Options3 byte "c)   ",0
	Options4 byte "d)   ",0
	TrueMsg byte "True",0
	FalseMsg byte "False",0


			;; msg for asking the answer from user
	AnswerMsg byte "Enter your option number corresponding value: ",0
	AnswerMsg1 byte "Enter your option number corresponding character (T/F): ",0 
	TotalScoreMsg byte "Your Total Score is: ",0
	WelcomeMaths byte "		==============================MATHEMATICS SECTION===================================",0
	WelcomePhysics byte "			==============================PHYSICS SECTION===================================",0
	WelcomeStats byte "	   	==============================STATISTICS SECTION===================================",0
	WelcomeQuiz byte "		*************************************************************************************",0
	WelcomeQuiz1 byte "						WELCOME TO THE QUIZ TEST",0
	;;msg for menu
	menu1 byte "					Enter your choice :",0
	menu2 byte "					1->		Physics",0
	menu3 byte "					2->		Mathematics",0
	menu4 byte "					3->		Statistics",0
	menu5 byte "					4->		Exit",0
	ErrorMsg byte "Invalid Input!",0
	
			;;array for printing the write ans in radom position
	print1 word 4 dup(?)

			;; variable for keeping track of all the questions generated to avoid repetation
	PhysicsQuestionCount byte 5 DUP (?)
	StatisticsQuestionCount byte 3 DUP (?)
	MathsQuestionCount byte 5 DUP (?) 

	StatisticsQNumber byte ?
	PhysicsQNumber byte ?
	MathsQNumber byte ?
	Count byte 0
.code

Score PROC
	mov eax,0
	Call GetMSeconds
	mov stime,eax
	mov edx,offset AnswerMsg
	Call WriteString
	Call ReadInt
	Call GetMSeconds
	sub eax,stime
	cmp eax,10000
	ja Outside
	cmp ax,CorrectAnswer
	je ChangeScore
	jmp OutSide
	ChangeScore:
		inc Total_Score

	OutSide:
		Call Crlf
		mov edx,offset TotalScoreMsg
		Call WriteString
		mov edx,offset msg
		Call WriteString
		movzx eax,Total_Score
		Call WriteDec
		mov eax,0
		Call Crlf
ret
Score ENDP

Physics PROC

	mov al,PhysicsQNumber
	cmp al,1
	je NewtonLawCalling
	cmp al,2
	je CurrentCalling
	cmp al,3
	je TorqueCalling
	cmp al,4
	je VelocityCalling
	cmp al,5
	je  DisplacementCalling
	cmp al,6
	je CentripetalCalling
	cmp al,7
	je LinearMomentumCalling
	cmp al,8
	je AngularVelocityCalling
	cmp al,9
	je KineticCalling
	cmp al,10
	je FrequencyCalling
	cmp al,11
	je SpeedWaveCalling

	NewtonLawCalling:
		Call Newton_Law
		jmp Outside
	CurrentCalling:
		Call Current
		jmp Outside
	TorqueCalling:
		Call Torque
		jmp Outside
	VelocityCalling:
		Call Velocity
		jmp Outside
	DisplacementCalling:
		Call Distance
		jmp Outside
	CentripetalCalling:
		Call Centripetal_Acc
		jmp Outside
	LinearMomentumCalling:
		Call Linear_Momentum
		jmp Outside
	AngularVelocityCalling:
		Call Angular_Velocity
		jmp Outside
	KineticCalling:
		Call Kinetic_Energy
		jmp Outside
	FrequencyCalling:
		Call Frequency
		jmp Outside
	SpeedWaveCalling:
		Call Wave_Speed


	Outside:
		ret
Physics ENDP

PhysicsQuestions PROC
	RegenerateNumber:
		Call Randomize
		mov eax,11
		Call RandomRange
		add eax,1
		mov ecx,5
		mov esi,0
		mov edi,0
		CheckRepetation:
			mov bl,PhysicsQuestionCount[esi]
			cmp al,bl
			je RegenerateNumber
			inc esi
			Loop CheckRepetation
		mov PhysicsQNumber,al
		movzx ebx,Count
		mov PhysicsQuestionCount[ebx],al
		inc Count
		mov ebx,0
		Call Physics
		ret
ret
PhysicsQuestions ENDP

PhysicsQuestionGenerator PROC
	Call Crlf
	Call Crlf
	mov edx,offset WelcomePhysics
	Call WriteString
	Call Crlf
	Call Crlf
	mov edx,0
	mov ecx,5
	PROCCalling:
		push ecx
		Call PhysicsQuestions
		pop ecx
		Loop PROCCalling

	mov Count,0
	Call ClrScr
	ret
PhysicsQuestionGenerator ENDP

Maths PROC

	mov al,MathsQNumber
	cmp al,1
	je CubeCalling
	cmp al,2
	je SquareCalling
	cmp al,3
	je GeometricCalling
	cmp al,4
	je ArithmeticCalling
	cmp al,5
	je PalindromicCalling
	cmp al,6
	je PentagonalCalling
	cmp al,7
	je SquareFreeCalling
	;cmp al,8
	;je CompositeCalling
	cmp al,9
	je RelativeCalling
	cmp al,10
	je TriangleCalling

	CubeCalling:
		Call cubenum
		jmp Outside
	SquareCalling:
		Call sqnum
		jmp Outside
	GeometricCalling:
		Call GeometricSeries
		jmp Outside
	ArithmeticCalling:
		Call ArithmeticSeries
		jmp Outside
	PalindromicCalling:
		Call Palindromic_Number
		jmp Outside
	PentagonalCalling:
		Call pentagonalnum
		jmp Outside
	SquareFreeCalling:
		Call isquarefree
		jmp Outside
	;CompositeCalling:
	;	Call compositenum
	;	jmp Outside		
	RelativeCalling:
		Call relativelyprime
		jmp Outside
	TriangleCalling:
		Call TriangleNum
	Outside:
		ret
Maths ENDP

MathsQuestions PROC
	RegenerateNumber:
		Call Randomize
		mov eax,11
		Call RandomRange
		add eax,1
		mov ecx,5
		mov esi,0
		mov edi,0
		CheckRepetation:
			mov bl,MathsQuestionCount[esi]
			cmp al,bl
			je RegenerateNumber
			inc esi
			Loop CheckRepetation
		mov MathsQNumber,al
		movzx ebx,Count
		mov MathsQuestionCount[ebx],al
		inc Count
		mov ebx,0
		Call Maths
		ret
ret
MathsQuestions ENDP

MathsQuestionGenerator PROC
	Call Crlf
	Call Crlf
	mov edx,offset WelcomeMaths
	Call WriteString
	Call Crlf
	Call Crlf
	mov ecx,5
	PROCCalling:
		push ecx
		Call MathsQuestions
		pop ecx
		Loop PROCCalling

	mov Count,0

	Call ClrScr
	ret
MathsQuestionGenerator ENDP

Statistics PROC
	mov al,StatisticsQNumber
	cmp al,1
	 je MeanCalling
	cmp al,2
	 je MedianCalling
	cmp al,3
	 je ModeCalling
	cmp al,4
	 je InterpolationCalling
	cmp al,5
	 je ValueSummationCalling

	MeanCalling:
		Call MeanQuestion
		jmp Outside
	MedianCalling:
		Call MedianQuestion
		jmp Outside
	ModeCalling:
		Call Mode
		jmp Outside
	InterpolationCalling:
		Call Slope
		jmp Outside
	ValueSummationCalling:
		Call ValueSummation
	Outside:	
		ret
Statistics ENDP

StatisticsQuestion PROC
	RegenerateNumber:
		Call Randomize
		mov eax,5
		Call RandomRange
		add eax,1
		mov ecx,3
		mov esi,0
		mov edi,0
		CheckRepetation:
			mov bl,StatisticsQuestionCount[esi]
			cmp al,bl
			je RegenerateNumber
			inc esi
			Loop CheckRepetation
		mov StatisticsQNumber,al
		movzx ebx,Count
		mov StatisticsQuestionCount[ebx],al
		inc Count
		mov ebx,0
		Call Statistics
		ret
StatisticsQuestion ENDP

StatsQuestionGenerator PROC
	Call Crlf
	Call Crlf
	mov edx,offset WelcomeStats
	Call WriteString
	Call Crlf
	Call Crlf
	mov ecx,3
	PROCCalling:
		push ecx
		Call StatisticsQuestion
		pop ecx
		Loop PROCCalling

	mov Count,0

	Call ClrScr
	ret
StatsQuestionGenerator ENDP
WriteAnsTrue PROC
		Call Crlf
		mov edx,offset Options1
		Call WriteString
		mov edx,0
		mov edx,offset TrueMsg;
		Call WriteString
		Call Crlf
		mov edx,offset Options2
		Call WriteString
		mov edx,offset FalseMsg
		Call WriteString
		Call Crlf
		mov eax,0
		mov edx,offset AnswerMsg1
		Call WriteString
		Call ReadChar
		cmp al,116
		je ChangeAscii
		cmp al,102
		je ChangeAscii
		jmp Display
		ChangeAscii:
			sub al,32
		
	Display:
		Call WriteChar
		Call Crlf
		movzx ebx,CorrectAnswer
		cmp al,bl
		je CorrectLabel
		jne FalseLabel
		CorrectLabel:
			Call Crlf
			inc Total_Score
			mov edx,offset TotalScoreMsg
			Call WriteString
			movzx eax,Total_Score
			Call WriteDec
			mov eax,0
			Call Crlf
			jmp Term
		FalseLabel:
			Call Crlf
			mov edx,offset TotalScoreMsg
			Call WriteString
			movzx eax,Total_Score
			Call WriteDec
			mov eax,0
			Call Crlf
Term: ret
WriteAnsTrue ENDP

writeans PROC
		;;random postion for right answer
		mov eax,0
		mov ecx,0
		mov edx,0
		mov ebx,0
			call randomize
			mov eax,4
			call randomrange
			mov esi,eax
			mov print1[esi],1  ;added one to position where is right answer

				;;NOW TO PRINT WRITE AND WRONG ANS
			mov esi,0
			mov edi,0
			mov ecx,4
			 ;;loop to print ans
		printans:
			mov ebx,0
			mov bx,print1[esi]
			cmp bx,1
			je rightans
			jmp wrongans
			l1:inc esi
			loop printans
			jmp end2

			;;THIS IS WHERE WRONG ANSWERS ARE PRINTED
			wrongans:
			cmp esi,0
				je optiona1
				cmp esi,1
				je optionb1
				cmp esi,2
				je optionc1
				cmp esi,3
				je optiond1
				Optiona1:
					mov edx,offset options1
					call writestring
					mov eax,0
					mov ax,otheroptions[edi]
					add edi,type OtherOptions
					call writedec
					call crlf
					jmp l1
				Optionb1:
					mov edx,offset options2
					call writestring
					mov eax,0
					mov ax,otheroptions[edi]
					add edi,type OtherOptions
					call writedec
					call crlf
					jmp l1
				Optionc1:
					mov edx,offset options3
					call writestring
					mov eax,0
					mov ax,otheroptions[edi]
					add edi,type OtherOptions
					call writedec
					call crlf
					jmp l1
				Optiond1:
					mov edx,offset options4
					call writestring
					mov eax,0
					mov ax,otheroptions[edi]
					add edi,type OtherOptions
					call writedec
					call crlf
					jmp l1


					;; THIS IS WHERE RIGHT ANSWER IS PRINTED
			rightans:
				cmp esi,0
				je optiona
				cmp esi,1
				je optionb
				cmp esi,2
				je optionc
				cmp esi,3
				je optiond
				Optiona:
					mov edx,offset options1
					call writestring
					mov eax,0
					mov ax,CorrectAnswer
					call writedec
					call crlf
					jmp l1
				Optionb:
					mov edx,offset options2
					call writestring
					mov eax,0
					mov ax,CorrectAnswer
					call writedec
					call crlf
					jmp l1
				Optionc:
					mov edx,offset options3
					call writestring
					mov eax,0
					mov ax,CorrectAnswer
					call writedec
					call crlf
					jmp l1
				Optiond:
					mov edx,offset options4
					call writestring
					mov eax,0
					mov ax,CorrectAnswer
					call writedec
					call crlf
					jmp l1
			end2:
			mov esi,0
			mov ecx,4
			nullprint1:
				mov print1[esi],0
				inc esi
				loop nullprint1
ret
writeans ENDP

Palindromic_Number PROC
	mov edx,offset Mmsg2
	Call WriteString
	Call Randomize
	mov eax,244
	Call RandomRange
	add eax,10
	;Call DumpRegs
	mov PalindromicNumber,al
	Call WriteDec
	Call Crlf
	cmp al,99
	ja ThreeDigit
	jbe TwoDigit
	ThreeDigit:
		mov ebx,0
		mov ecx,0
		mov edx,0
		movzx ax,al
		div divTerm
		mov bl,ah		;; remainder
		mov cl,al		;; quotient
		mov eax,0
		mov al,bl
		mul mulTerm2
		add PalindromicNumberReverse,al		;; number after multiplying by 100
		mov ebx,0
		movzx ax,cl
		mov ecx,0
		div divTerm
		mov bl,ah
		mov cl,al
		mov eax,0
		mov al,bl
		mul mulTerm1
		add PalindromicNumberReverse,al
		add PalindromicNumberReverse,cl
		jmp Comparison
	TwoDigit:
		mov ebx,0
		mov ecx,0
		mov edx,0
		movzx ax,al
		div divTerm
		mov bl,ah
		mov cl,al
		mov eax,0
		mov al,bl
		mul mulTerm1
		Add PalindromicNumberReverse,al
		add PalindromicNumberReverse,cl
	Comparison:
		mov al,PalindromicNumber
		mov bl,PalindromicNumberReverse
		cmp al,bl
		jz Palindrome
		mov CorrectAnswer,"F"
		Call Crlf
		jmp Term
		Palindrome:
			mov CorrectAnswer,"T"
			Call Crlf

Term : Call WriteAnsTrue
ret
Palindromic_Number ENDP

ArithmeticSeries PROC
	mov edx,offset Mmsg1
	Call WriteString
	Call Randomize
	mov eax,10
	Call RandomRange
	add eax,1
	cmp al,1
	je AddFive
	mov First_Term,al
	mov Series[0],al
	jmp GenerateCommonDifference
	AddFive:
		add eax,5
		mov First_Term,al
		mov Series[0],al
	GenerateCommonDifference:
		Call Randomize
		mov eax,8
		Call RandomRange
		add eax,1
		cmp al,1
		je AddFour
		mov Common_Diff,al
		jmp CalculateAnswer
		AddFour:
			add eax,4
			mov Common_Diff,al
			
	CalculateAnswer:
		mov esi,0
		mov ecx,14
		FormSeries:
			mov al,First_Term
			add al,Common_Diff
			mov Series[esi+1],al
			inc esi
			mov First_Term,al
			Loop FormSeries

		Call Randomize
		mov eax,15
		Call RandomRange
		add eax,1
		cmp al,3
		jb AddSix
		SeriesPrintLabel:
			mov ecx,eax
			mov esi,0
			mov edx,offset msg1
			PrintSeries:
				movzx eax,Series[esi]
				Call WriteDec
				Call WriteString
				inc esi
				Loop PrintSeries
		mov edx,offset msg2
		Call WriteString
		jmp CorrectAnswerLabel
		AddSix:
			add eax,6
			jmp SeriesPrintLabel

		CorrectAnswerLabel:
			Call Crlf
			movzx ax,Series[esi]
			mov CorrectAnswer,ax
	mov eax,0
	mov esi,0
			movzx eax,CorrectAnswer
			add al,Common_Diff
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add al,Common_Diff
			add al,Common_Diff
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			Call Score

ret
ArithmeticSeries ENDP

TriangleNum proc
	mov edx,offset Mmsg3
	Call WriteString
	mov eax,0
	call randomize
	mov eax,10
	call randomrange
	add eax,1
	Call WriteDec
	mov edx,0
	mov bl,al
	add eax,1
	mul bl
	div valMultiplier
	movzx dx,al
	mov CorrectAnswer,dx
	Call Crlf
	mov esi,0
	mov eax,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			sub ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,4
			mov otheroptions[esi],ax
			add esi,type OtherOptions
		Call WriteAns
		Call Score
		ret
trianglenum endp

Compositenum proc
		l1:
	mov edx,offset Mmsg4
	Call WriteString
	mov eax,0
	call randomize
	mov eax,255
	call randomrange
	add al,1
	cmp al,1
	jz l1
	jmp l2
	l2:
	 cmp al,2
	 jz l1
	 jmp l3
	 l3:
	 cmp al,3
	 jz l1
	 jmp l4
	 l4:
	 mov temp,al
	 div valMultiplier
	 movzx ecx,al;;loop half of original number
	 mov eax,0
	 mov edx,0
	 mov edx,ecx
	 movzx eax,temp;;to restore original value
	 l5:
	  div cl
	  cmp ah,0
	  je equal
	  movzx eax,temp
	 loop l5
	 notequal:
	 movzx eax,temp
	 call writedec
	 mov CorrectAnswer,"F"
	 call crlf
	 jmp term
	 equal:
	 movzx eax,temp
	 call writedec
	 mov CorrectAnswer,"T"
	 term:
	 call WriteAnsTrue	
	ret
Compositenum endp

Relativelyprime proc
	mov edx,offset Mmsg6
	Call WriteString
	mov eax,0
	mov edx,0
	mov ebx,0
	mov temp,0
	call randomize;;generating first value
	mov eax,14
	call randomrange
	add eax,1
	mov firstnumber,al
	Call WriteDec
	mov edx,offset msg
	Call WriteString
	mov edx,eax
	mov eax,0
	mov eax,14
	call randomrange
	add eax,1
	mov secondnumber,al
	Call WriteDec
	mov ebx,eax
	cmp firstnumber,bl
	jg firstnum
	jL secondnum
	firstnum:
	mov eax,edx
	mov temp,bl
	div temp
	cmp ah,0
	jmp notgcd
	jmp gcd
	secondnum:
	mov eax,ebx
	mov temp,dl
	div temp
	cmp ah,0
	jmp notgcd
	jmp gcd
	gcd:
	movzx eax,firstnumber
	;call writedec
	;call crlf
	mov CorrectAnswer,"T"
	call WriteAnsTrue	
	ret
	notgcd:
	movzx eax,firstnumber
	;call writedec
	call crlf
	mov CorrectAnswer,"F"
	call WriteAnsTrue	
	ret
Relativelyprime endp

isquarefree proc
	call randomize
	mov eax,250
	call randomrange
	add ax,3
	mov valsquarefree,ax
	mov edx,offset Mmsg7
	call writestring
	call writedec

	l1: mov ax,valsquarefree
	mov ebx,0
	mov bl,valMultiplier
	div bl
	cmp ah,0
	jne againdividetwo
	mov eax,0
	mov ebx,0
	mov ax,valsquarefree
	mov bl,valMultiplier
	div bl
	mov ah,0
	mov valsquarefree,ax

	againdividetwo:
	mov eax,0
	mov ax,valsquarefree
	mov ebx,0
	mov bl,valMultiplier
	div bl
	cmp ah,0
	jne looping
	;mov edx,offset false1
	mov CorrectAnswer,"F"
	;call writestring
	Call WriteAnsTrue 
	ret

	looping:
	mov eax,0
	mov ebx,0
	mov ecx,0
	mov ax,valsquarefree
	sub ax,3
	mov ecx,eax
	mov bl,3

	l2:
	mov eax,0
	mov ax,valsquarefree
	div bl
	cmp ah,0
	jne l3
	mov ax,valsquarefree
	div bl
	mov ah,0
	mov valsquarefree,ax
	mov ax,valsquarefree
	div bl
	cmp ah,0
	jne l3
	mov CorrectAnswer,"F"
	Call WriteAnsTrue
	ret
	l3:
	add bl,1
	loop l2
	mov CorrectAnswer,"T"
	Call WriteAnsTrue
	ret
isquarefree ENDP

GeometricSeries PROC
	mov edx,offset Mmsg1
	Call WriteString
	Call Randomize
	mov eax,3
	add eax,1
	mov GFirst_Term,ax
	mov GSeries[0],ax
	;Call WriteDec
	Call Randomize
	mov eax,4
	Call RandomRange
	add eax,1
	mov GCommon_Diff,ax
	;Call Crlf
	;Call WriteDec
	;Call Crlf
	mov ecx,5
	mov esi,0
	CreateSeries:
		mov edx,0
		mov ax,GFirst_Term
		mul GCommon_Diff
		mov GSeries[esi+2],ax
		add esi,2
		mov GFirst_Term,ax
		loop CreateSeries

	mov edx,offset msg1
	mov ecx,5
	mov esi,0
	PrintSeries:
		movzx eax,GSeries[esi]
		Call WriteDec
		Call WriteString
		add esi,2
		Loop PrintSeries
	mov edx,offset msg2
	Call WriteString
	Call Crlf
	mov ax,GSeries[esi]
	mov CorrectAnswer,ax

	mov eax,0
	mov esi,0
			movzx eax,CorrectAnswer
			add ax,9
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,GCommon_Diff
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			Call Score
ret
GeometricSeries ENDP

cubenum proc
	mov edx,offset Mmsg8
	Call WriteString
	mov eax,0
	mov ebx,0
	call randomize
	mov eax,10
	call randomrange
	add al,3
	Call WriteDec
	Call Crlf
	mov bl,al
	mul al
	mul bl
	mov CorrectAnswer,ax
	;call writedec
	mov esi,0
	mov eax,0
			movzx eax,CorrectAnswer
			add ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			sub ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,5
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			Call writeans
			Call Score
	ret
cubenum endp

sqnum proc
	
	mov edx,offset Mmsg9
	Call WriteString
	call randomize
	mov eax,14
	call randomrange
	add eax,1
	;;generating value for square
	mov valsquare,al
	Call WriteDec
	mul al
	mov CorrectAnswer,ax
	;call writedec
	Call Crlf
	mov esi,0
	mov eax,0
			movzx eax,CorrectAnswer
			add ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			sub ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,5
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			Call writeans
			Call Score
	ret
sqnum endp

Pentagonalnum proc;;3n^2-n/2 (formula for pentagonal number)
	mov edx,offset Mmsg5 
	Call WriteString
	mov ebx,0
	mov eax,0
	call randomize ;;consider a pentagon of length l and is it(whatever in eax after applying formula)the correct pentagonal number
	mov eax,14
	call randomrange;;
	;Call Crlf
	add al,1
	Call WriteDec
	Call Crlf
	movzx bx,al
	mul al
	mul mulTerm3
	sub ax,bx
	div valMultiplier
	movzx eax,al
	mov CorrectAnswer,ax
	;movzx eax,CorrectAnswer
	;Call WriteDec

	mov eax,0
	mov esi,0
			movzx eax,CorrectAnswer
			add ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			Call Score

	ret
Pentagonalnum endp

Mode PROC
	mov edx,offset Smsg4
	Call WriteString
	mov edx,offset msg
	mov ecx,15
	Call Randomize
	mov esi,0
	GenerateNumber:
		mov eax,100
		Call RandomRange
		div divTerm
		cmp ah,0
		je ChangeAH
		mov ModeArr[esi],ah
		jmp Loop_Label
		ChangeAH:
			add ah,1
			mov ModeArr[esi],ah
		Loop_Label: 
			movzx eax,ModeArr[esi]
			Call WriteDec
			Call WriteString
			inc esi
			loop GenerateNumber
		
		Call Crlf
		mov ecx,15
		mov esi,0
		CalculateFrequency:
			movzx eax,ModeArr[esi]
			movzx ebx,FreqMode[eax]
			inc ebx
			mov FreqMode[eax],bl
			;Call DumpRegs
			inc esi
			Loop CalculateFrequency
		
		;mov eax,0
		;mov ecx,10
		;mov esi,0
		;PrintFreq:
	;		movzx eax,FreqMode[esi]
	;		Call WriteDec
	;		Call WriteString
	;		inc esi
	;		Loop PrintFreq
		Call Crlf
		mov ecx,9
		mov esi,0
		mov ebx,0
		mov edi,0
		mov al,FreqMode[esi]
		mov max,al
		inc esi
		FindMaximum:
			mov bl,FreqMode[esi]
			cmp bl,max
			jbe loopagain
			mov max,bl
			mov index,esi
			loopagain:
			inc esi
				loop  FindMaximum
		;movzx eax,max
		;Call WriteDec
		;Call Crlf
		mov eax,index
		;Call WriteDec
		mov CorrectAnswer,ax
		movzx eax,CorrectAnswer
		;Call WriteDec
				
		mov eax,0
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			call Score
ret
Mode ENDP

Slope PROC
	mov edx,offset Smsg3
	Call WriteString
	mov edx,offset Smsg3i
	Call Randomize
	mov eax,6
	Call RandomRange
	add eax,2
	mov valY,al
	Call WriteDec
	Call WriteString
	mov edx,offset Smsg3ii
	mov eax,100
	Call RandomRange
	add eax,2
	mov valM,al
	Call WriteDec
	Call WriteString
	mov eax,10
	Call RandomRange
	add eax,1
	Call WriteDec
	mov valC,al
	cal: ;now calculation of slope
	movzx ax,valM
	mov ebx,0
	mov bl,valY
	div bl
	mov ebx,0
	movzx bx,al
	mov CorrectAnswer,bx
	;now options generations
	mov eax,0
	mov ax,CorrectAnswer
	;Call WriteDec
	mov esi,0
	add ax,1
	mov OtherOptions[esi],ax
	mov eax,0
	movzx ax,valM
	add esi,type OtherOptions
	mov OtherOptions[esi],ax
	add esi,type OtherOptions
	add ax,2
	mov OtherOptions[esi],ax
	mov esi,0
	mov ecx,3
	Call Crlf
	Call writeans
	Call Score
ret
Slope ENDP

MedianQuestion PROC
	mov edx,offset Smsg1
	Call WriteString
	Call Randomize
	mov ecx,lengthof Median1
	mov esi,0
	GenerateNumbers:
		mov eax,31
		Call RandomRange
		mov Median1[esi],al
		;Call WriteDec
		;Call Crlf
		inc esi
		loop GenerateNumbers
		
	Call Randomize
	mov eax,lengthof Median1 - 4
	Call RandomRange
	add eax,4
	mov ecx,eax
	mov ebx,eax
	mov esi,0
	PrintSeries:
		movzx eax,Median1[esi]
		Call WriteDec
		mov edx,offset msg1
		CAll WriteString
		inc esi
		Loop PrintSeries
	Call Crlf
	mov ax,bx
	mov cl,2
	div cl
	cmp ah,0
	jz EvenMethod
	jnz OddMethod
	EvenMethod:
		movzx esi,al
		mov al,Median1[esi]
		mov ebx,0
		mov bl,Median1[esi-1]
		add al,bl
		movzx ax,al
		div cl
		movzx edx,al
		mov CorrectAnswer,dx
		movzx eax,CorrectAnswer
		;Call WriteDec
		jmp OutSide
	OddMethod:
		movzx esi,al
		movzx ax,Median1[esi]
		mov CorrectAnswer,ax
		movzx eax,CorrectAnswer
		;Call WriteDec


Outside:
	mov eax,0
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			sub ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			call Score	
	ret
MedianQuestion ENDP

MeanQuestion PROC
	mov edx,offset Smsg2
	Call WriteString
	mov ecx,lengthof Mean
	mov esi,0
	Call Randomize
	GenerateMeanValues:
		mov eax,20
		Call RandomRange
		mov Mean[esi],al
		inc esi
		Loop GenerateMeanValues
	mov eax,0
	mov ecx,lengthof Mean
	dec ecx
	mov esi,0
	mov edx,offset msg1
	PrintSeries:
		movzx eax,Mean[esi]
		Call WriteDec
		Call WriteString
		inc esi
		Loop PrintSeries
	movzx eax,Mean[esi]
	Call WriteDec
	Call Crlf
	mov eax,0
	mov ecx,lengthof Mean
	mov esi,0		
	CalculateSum:
		add al,Mean[esi]
		inc esi
		loop CalculateSum

	;Call WriteDec
	mov bl,lengthof Mean
	div bl
	mov ecx,0
	movzx cx,al
	mov CorrectAnswer,cx
	mov eax,0
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			call Score
	ret
MeanQuestion ENDP

ValueSummation PROC
	
	mov edx,offset Smsg5
	Call WriteString
	mov ecx,lengthof Summation
	mov edx,offset msg1
	Call Randomize
	mov esi,0
	GenerateValues:
		mov eax,15
		Call RandomRange
		add eax,1
		;Call WriteDec
		;Call WriteString
		mov Summation[esi],al
		inc esi
		loop GenerateValues
	Call Randomize
	mov eax,14
	Call RandomRange
	add eax,1
	mov ecx,eax
	mov esi,0
	mov eax,0
	mov ebx,0
	CalculateSum:
		movzx ax,Summation[esi]
		Call WriteDec
		Call WriteString
		add bx,ax
		inc esi
		loop CalculateSum
	Call Crlf
	mov CorrectAnswer,bx
	movzx eax,CorrectAnswer
	;Call WriteDec
	;Call Crlf
	mov eax,0
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			call Score
ret
ValueSummation ENDP


Newton_Law PROC
			;; generating the val of mass
		Call Randomize
		mov eax,30
		Call RandomRange
		add eax,1
		mov valMass,al
		mov eax,0
		;Call DumpRegs
			;; generatring the value of acc
		;Call Randomize
		mov eax,30
		Call RandomRange
		add eax,1
		mov valAcc,al
		mov edx,offset Pmsg1
		Call WriteString
		movzx eax,valMass
		Call WriteDec
		mov edx,offset msg
		Call WriteString
		movzx eax,valAcc
		Call WriteDec
		Call Crlf
		mov eax,0
		;Call DumpRegs
			;; Calculating the correct answer
		mov al,valMass
		mul valAcc
		mov CorrectAnswer,ax
		;Call WriteDec
		Call Randomize
		Call RandomRange
		mov esi,0
		Call Randomize

		;;wrong answers added
		FillOther:
			movzx eax,CorrectAnswer
			add ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			sub ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,10
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			Call Score
			
ret		
Newton_Law ENDP



Kinetic_Energy PROC
		;; generating value of mass 
		mov eax,0
		mov ecx,0
		mov edx,0
		mov ebx,0
	Call Randomize
	mov eax,0
	mov eax,50
	Call RandomRange
	mov valMass,al
	mov eax,0
		;; generating value of velocity
	Call Randomize
	mov eax,15
	Call RandomRange
	add al,1
	mov valVelocity,al
	movzx ax,valVelocity
	mov bl,2
	div bl
	cmp ah,0
	jne ChangeVelocity
	je NoChange
	ChangeVelocity:
		movzx ax,valVelocity
		add eax,1
		mov valVelocity,al
		jmp Calculations
	NoChange:
	mov ebx,0
	mov eax,0
	Calculations:
	mov edx,offset Pmsg4
	Call WriteString
	mov edx,0
	movzx eax,valMass
	Call WriteDec
	mov edx,offset msg
	Call WriteString
	movzx eax,valVelocity
	Call WriteDec
	Call Crlf
	mov al,valVelocity
	mul al
	mov bl,2
	div bl
	mov ebx,0
	mov bl,al
	mov eax,0
	mov al,bl
	mul valMass
	mov CorrectAnswer,ax
	mov eax,0
	mov  ax,CorrectAnswer
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			sub ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,5
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			Call Score

ret
Kinetic_Energy ENDP

Centripetal_Acc PROC
		mov eax,0
		mov ecx,0
		mov edx,0
		mov ebx,0
	Call Randomize
	mov eax,15
	Call RandomRange
	add eax,3
	mov valVelocity,al
	Call Randomrange
	add eax,2
	mov valRadius,al
	mov edx,offset Pmsg5
	Call WriteString
	movzx eax,valVelocity
	Call WriteDec
	mov edx,offset msg
	Call WriteString
	movzx eax,valRadius
	Call WriteDec
	Call Crlf
	;now for the calculation
	mov eax,0
	mov al,valVelocity
	mul al
	mov ebx,0
	mov bl,valRadius
	div bl
	mov edx,0
	movzx dx,al
	mov CorrectAnswer,dx
	mov ax,CorrectAnswer
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,4
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			sub ax,1
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			Call Score
ret
Centripetal_Acc ENDP


Current PROC
	mov eax,0
		mov ecx,0
		mov edx,0
		mov ebx,0
	mov edx,offset Pmsg6
	Call WriteString
		;; generating the value of charge
	Call Randomize
	mov eax,80
	Call RandomRange
	add eax,1
	mov valCharge,al
	Call WriteDec
	mov edx,offset msg
	Call WriteString
		;; generating the value of time
	Call Randomize
	Call RandomRange
	add eax,1
	mov valTime,al
	Call WriteDec
	Call Crlf
		;; Calculating correct answer
	mov eax,0
	mov edx,0
	mov ebx,0
	movzx ax,valCharge
	div valTime
	movzx dx,al
	mov CorrectAnswer,dx
	movzx eax,CorrectAnswer
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,5
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			call Score

ret
Current ENDP


Torque PROC
	mov edx,offset Pmsg7
	Call WriteString
	Call Randomize
	mov eax,15
	Call RandomRange
	add eax,1
	Call WriteDec
	mov valRadius,al
	mov eax,0
	mov eax,15
	Call Randomrange
	add eax,1
	mov edx,offset msg
	Call WriteString
	Call WriteDec
	Call Crlf
	mov edx,0
	mov valForce,al
	mov eax,0
	mov al,valForce
	mul valRadius
	mov CorrectAnswer,ax
	;Call WriteDec
	movzx eax,CorrectAnswer
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,10
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			sub ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,4
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			call Score

ret
Torque ENDP


Velocity PROC
	mov edx,offset Pmsg8
	Call WriteString
	mov edx,offset msg
	Call Randomize
	mov eax,60
	Call RandomRange
	add eax,3
	Call WriteDec
	Call WriteString
	mov valDisplacement,al
	Call RandomRange
	add eax,1
	Call WriteDec
	Call Crlf
	mov valTime,al
	mov eax,0
	mov edx,0
	mov ebx,0
	movzx ax,valDisplacement
	div valTime
	movzx dx,al
	mov CorrectAnswer,dx
	mov eax,0
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,2
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,5
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			Call Score
ret
Velocity ENDP

Distance PROC
	mov edx,offset Pmsg9
	Call WriteString
	;;generating value for velocity
	call randomize
	mov eax,0
	mov eax,10
	call randomrange
	
	mov valVelocity,al
	call writedec
	;;generating value for time
	mov eax,0
	mov eax,10
	call randomrange
	
	mov edx,offset msg
	call writestring
	call writedec
	call crlf
	mov valTime,al
	mul valVelocity
	mov CorrectAnswer,ax
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,5
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,9
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			Call Score
ret
Distance ENDP

Linear_Momentum PROC
	mov edx,offset Pmsg13
	Call WriteString
	Call Randomize
	mov eax,0
	mov eax,15
	Call RandomRange
	add eax,2
		;;generating value for mass
	Call WriteDec
	mov edx,offset msg
	Call WriteString
	mov valMass,al
	mov eax,15
	Call RandomRange
	add eax,3
	Call WriteDec
	Call Crlf
		;; generating value for velocity
	mov valVelocity, al
	mul valMass
	mov correctanswer,ax
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			sub ax,5
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,9
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			Call Score
ret
Linear_Momentum ENDP 

Angular_Velocity PROC
			;; generating the value of velocity
	mov edx,offset Pmsg10
	Call WriteString
	mov edx,offset msg
	Call Randomize
	mov eax,18
	Call RandomRange
	add eax,1
	Call WriteDec
	mov valVelocity,al
			;; generating the value of radius
	Call RandomRange
	add eax,1
	Call WriteString
	Call WriteDec
	Call Crlf
	mov valRadius,al
			;; v=rw
	movzx ax,valVelocity
	div valRadius
	movzx dx,al
	mov CorrectAnswer,dx
	mov eax,0
	mov esi,0
	FillOther:
			movzx eax,CorrectAnswer
			add ax,3
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			movzx eax,CorrectAnswer
			add ax,5
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			mov ax,CorrectAnswer
			add ax,9
			mov otheroptions[esi],ax
			add esi,type OtherOptions
			call writeans
			Call Score

ret
Angular_Velocity ENDP

Frequency PROC
	mov edx,offset Pmsg12
	Call WriteString
		;; generating the value of velocity
	Call Randomize
	mov eax,25
	Call RandomRange
	add eax,1
	Call WriteDec
	mov edx,offset msg
	Call WriteString
	mov valVelocity,al
		;; generating the value of lambda
	Call RandomRange
	add eax,1
	Call WriteDec
	Call Crlf
	mov valLambda,al
		;; f=v/lambda
	movzx ax,valVelocity
	div valLambda
	movzx dx,al
	mov CorrectAnswer,dx
	movzx eax,CorrectAnswer
	;Call WriteDec
	mov eax,0
	mov esi,0
	movzx eax,CorrectAnswer
	add ax,3
	mov OtherOptions[esi],ax
	add esi,type OtherOptions
	movzx eax,CorrectAnswer
	add ax,9
	mov OtherOptions[esi],ax
	add esi,type OtherOptions
	movzx eax,CorrectAnswer
	add ax,5
	mov OtherOptions[esi],ax
	add esi,type OtherOptions
	Call WriteAns
	Call Score
	
ret
Frequency ENDP

Wave_Speed PROC

	mov edx,offset Pmsg11
	Call WriteString
		;; generating value of frequency
	Call Randomize
	mov eax,15
	Call RandomRange
	add eax,1
	Call WriteDec
	mov valVelocity,al
		;; generating the value of lambda
	
	mov eax,10
	Call RandomRange
	add eax,1
	mov edx,offset msg
	Call WriteString
	Call WriteDec
	Call Crlf
	mov valLambda,al
	mul valVelocity
	mov CorrectAnswer,ax
	movzx eax,CorrectAnswer
	;Call WriteDec

	mov eax,0
	mov esi,0

	movzx eax,CorrectAnswer
	add ax,3
	mov OtherOptions[esi],ax
	add esi,type OtherOptions
	movzx eax,CorrectAnswer
	add ax,9
	mov OtherOptions[esi],ax
	add esi,type OtherOptions
	movzx eax,CorrectAnswer
	add ax,5
	mov OtherOptions[esi],ax
	add esi,type OtherOptions
	Call WriteAns
	Call Score
ret
Wave_Speed ENDP



main PROC

	ReloopMain:
	mov edx,offset WelcomeQuiz
	Call WriteString
	Call Crlf
	mov edx,offset WelcomeQuiz1
	Call WriteString
	Call Crlf
	mov edx,offset WelcomeQuiz
	Call WriteString
	Call Crlf
	Call Crlf
	mov edx,0
	mov edx,offset menu2
	Call WriteString
	Call Crlf
	mov edx,offset menu3
	Call WriteString
	Call Crlf
	mov edx,offset menu4
	Call WriteString
	Call Crlf
	mov edx,offset menu5
	Call WriteString
	Call Crlf
	Call Crlf
	mov edx,offset menu1
	Call WriteString
	Call ReadInt
	cmp al,1
	je PhysicsCalling
	cmp al,2
	je MathsCalling
	cmp al,3
	je StatsCalling
	cmp al,4
	je Term
	mov edx,offset ErrorMsg
	Call WriteString
	mov eax,1000
	Call Delay
	Call Clrscr
	jmp ReloopMain
	PhysicsCalling:
		
		Call PhysicsQuestionGenerator
		ReloopPhysics:
		mov edx,offset menu3
		Call Crlf
		Call WriteString
		Call Crlf
		mov edx,offset menu4
		Call WriteString
		Call Crlf
		
		mov edx,offset menu1
		Call WriteString
		Call ReadInt
		cmp al,2
		je MathsPCalling
		cmp al,3
		je StatsPCalling
		mov edx,offset ErrorMsg
		Call WriteString
		mov eax,1000
		Call Delay
		Call Clrscr
		jmp ReloopPhysics
		MathsPCalling:
			Call Crlf
			Call MathsQuestionGenerator
			Call Crlf
			Call Crlf
			Call StatsQuestionGenerator
			Call Crlf
			jmp Term
		StatsPCalling:
			Call Crlf
			Call StatsQuestionGenerator
			Call Crlf
			Call Crlf
			Call MathsQuestionGenerator
			jmp Term
	MathsCalling:
		Call MathsQuestionGenerator
		ReloopMaths:
		mov edx,offset menu2
		Call Crlf
		Call WriteString
		Call Crlf
		mov edx,offset menu4
		Call WriteString
		Call Crlf
		mov edx,offset menu1
		Call WriteString
		Call ReadInt
		cmp al,1
		je PhysicsMCalling
		cmp al,3
		je StatsMCalling
		mov edx,offset ErrorMsg
		Call WriteString
		mov eax,1000
		Call Delay
		Call Clrscr
		jmp ReloopMaths
		PhysicsMCalling:
			Call Crlf
			Call PhysicsQuestionGenerator
			Call Crlf
			Call Crlf
			Call StatsQuestionGenerator
			Call Crlf
			jmp Term
		StatsMCalling:
			Call Crlf
			Call StatsQuestionGenerator
			Call Crlf
			Call Crlf
			Call PhysicsQuestionGenerator
			jmp Term
	StatsCalling:
		Call StatsQuestionGenerator
		ReloopStats:
		mov edx,offset menu2
		Call Crlf
		Call WriteString
		Call Crlf
		mov edx,offset menu3
		Call WriteString
		Call Crlf
		mov edx,offset menu1
		Call WriteString
		Call ReadInt
		cmp al,1
		je PhysicsSCalling
		cmp al,2
		je MathsSCalling
		mov edx,offset ErrorMsg
		Call WriteString
		mov eax,1000
		Call Delay
		Call Clrscr
		jmp ReloopStats
		PhysicsSCalling:
			Call Crlf
			Call PhysicsQuestionGenerator
			Call Crlf
			Call Crlf
			Call MathsQuestionGenerator
			Call Crlf
			jmp Term
		MathsSCalling:
			Call Crlf
			Call MathsQuestionGenerator
			Call Crlf
			Call Crlf
			Call PhysicsQuestionGenerator
			jmp Term
	Term:
		Call Clrscr
		mov edx,offset TotalScoreMsg
		Call WriteString
		movzx eax,Total_Score
		Call WriteDec
		Call Crlf
main ENDP
END main