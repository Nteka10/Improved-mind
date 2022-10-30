/*
Author: Nteka.M.E
Date: October 2022
*/

#include <stdio.h>
#include <math.h>

int reverse(int n){
	int  reverse = 0, rem;
	while(n != 0)
	{
		rem = n % 10;
		reverse = reverse * 10 + rem;
		n = n / 10;
	}
 	return reverse;
}
int is_prime(int n)
{

	for(int i = 2; i < n; i++)
	{
		if(n % i == 0)
		{
			return 0;
		}
	}
	return 1;
}
void reversible_prime_sqrs()
{
	for(int num = 1, count = 0; count < 10; num++){

		if(is_prime(num) == 1)
		{
			int square = num*num;
			int reversed = reverse(square);
			if(square != reversed)
			{
				for(int i = 0; i < reversed/2; i++)
				{
					if(i*i == reversed)
					{
						if(is_prime(i) == 1)
						{
							printf("\n%d",square);
							count ++;
						}
					}
				}
			}
		}
	}
}
int main()
{
    reversible_prime_sqrs();

    return 1;
}
