n = read("input.txt");


\\Principe de l'attaque
\\On sait que n est composé. En conséquence, il existe au moins un A
\\ tel que A soit un témoin de Miller Rabin pour n
\\ Fait intéressant, on peut utiliser le test de MR pour factoriser n
\\ On cherche un témoin tel que A^{d*2^r} = 1 mais pour tout k<r,
\\ A^{d*2^k} est différent de +-1
\\on aura alors A0 tel que A0² -1 = 0 mod n et A0 != +-1
\\il suffit alors de calculer gcd(A0-1,n) et gcd (A0+1,n)

millrabfact(val) = {
my(cpt,diad,tem,d,Ao);
cpt = 0;
diad=val-1;
while((diad%2 ==0), diad=diad/2; cpt++;);

while(1,
	tem =Mod(random(val-4)+2,n);
	d = tem^diad;
	if((lift(d) == 1 || lift(d)== n-1),0,
	for(i=1,cpt-1,
	Ao = d^2;
	if(lift(Ao) == 1, return(gcd(lift(d)-1,val)),d=Ao);
	if(lift(d)==val-1,break,0);
	);
	);
);
}
res = millrabfact(n);
printf(res);
