#include<stdio.h>
#include<string.h>
#include<ctype.h>

void main()
{
char input[50][50];
char exp[50],val;
int n,i,j,len,k;
printf("enter the number of expression");
scanf("%d",&n);
printf("enter the expressions");
for(i=0;i<n;i++)
{
scanf("%s",input[i]);
}
for(i=0;i<n;i++)
{
//sscanf(exp,"%s",input[i]);
strcpy(exp,input[i]);
if(strlen(exp)==3)
{
for(j=0;j<n;j++)
{
len=strlen(input[j]);
val=exp[0];
for(k=0;k<len;k++)
{
if(input[j][k]==val && strlen(input[j])!=3)
{


input[j][k]=exp[2];

}
}
}
}
}
for(i=0;i<n;i++)
{
printf("%s\n",input[i]);
}
}

