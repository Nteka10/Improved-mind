#include<iostream>
using namespace std;

int reverse(int num){
	int  reverse = 0, rem;
	while(num != 0)
	{
		rem = num % 10;
		reverse = reverse * 10 + rem;
		num = num / 10;
	}
 	return reverse;
}

int is_prime(int num)
{

	for(int i = 2; i < num; i++)
	{
		if(num % i == 0)
		{
			return 0;
		}
	}
	return 1;
}

void reversible_prime_sqrs()
{
	for(int number = 1, count = 0; count < 10; number++){

		if(is_prime(number) == 1)
		{
			int square = number*number;
			int reversed = reverse(square);
			if(square != reversed)
			{
				for(int i = 0; i < reversed/2; i++)
				{
					if(i*i == reversed)
					{
						if(is_prime(i) == 1)
						{
							cout<<square<<endl;
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
