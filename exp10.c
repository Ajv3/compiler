#include<stdio.h>
#include<string.h>
#include<stdlib.h>
char result[10][10],states[10][10],state[10],copy[10];
int n,k,i=0;

void add_state(char a[10],int i)
{
 strcpy(result[i],a);
}

void display(int n)
{
 printf("epsilon closure of %s - ",copy);
 for(int j=0;j<n;j++)
 {
  printf("%s ",result[j]);
 }
 printf("\n");
}

void main()
{
 char state1[10],input[10],state2[10],end;
 FILE *fp;
 printf("Enter the number of states\n");
 scanf("%d",&n);
 printf("enter the states to check\n");
 for(k=0;k<n;k++)
 {
 scanf("%s",states[k]);
 }
fp=fopen("input10.txt","r");
for(k=0;k<n;k++)
{
 i=0;
  strcpy(state,states[k]);
  strcpy(copy,state);
  add_state(state,i++);
 while(1)
 {
    end=fscanf(fp,"%s%s%s",state1,input,state2);
    if(end==EOF)
    {
  	break;
    }
  if(strcmp(state,state1)==0)
  {
   if(strcmp(input,"e")==0)
    {
     add_state(state2,i++);
     strcpy(state,state2);
    }
  }
 }
  display(i);
  rewind(fp);
}
}
