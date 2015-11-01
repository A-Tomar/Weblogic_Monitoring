#include<stdio.h>
#include<string.h>
#include <iostream>
#include <algorithm>
#include <string>
using namespace std;

int max_pr = 0 ; 
int int1 = 0 ;
int int2 = 0 ;

int profit_value(char* input1[],int input2)
{

for( int a = 0; a < input2; a = a + 1 )
{
cout << "value of a: " << input1[a] << "\n";
#define MAXSPACE 25
string line = input1[a];

std::replace( line.begin(), line.end(), '#', '|'); // replace all 'x' to 'y'
string arr[MAXSPACE];
string search = "|";
int spacePos;
int currPos = 0;
int k = 0;
int prevPos = 0;

do
{

spacePos = line.find(search,currPos);

if(spacePos >= 0)
{

currPos = spacePos;
arr[k] = line.substr(prevPos, currPos - prevPos);
currPos++;
prevPos = currPos;
k++;
}


}while( spacePos >= 0);

arr[k] = line.substr(prevPos,line.length());
int aa = atoi(arr[0].c_str());
int b = atoi(arr[1].c_str());
if (int2<=aa)
{
max_pr++;
cout << "+1 mxpr" << max_pr << endl;
int1 = aa ;
int2 = b ;
}
else 
{
cout << arr[0] << endl;
cout << arr[1] << endl;
int1 = aa ; 
}



}


return max_pr ;

}
