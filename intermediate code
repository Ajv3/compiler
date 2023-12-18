#include<stdio.h>
#include<string.h>

char op[4],arg1[5],arg2[5],result[5];
void main()
{
	FILE *fp1,*fp2;
	fp1=fopen("input.txt","r");
	fp2=fopen("output.txt","w");
	fscanf(fp1,"%s%s%s%s",op,arg1,arg2,result);
	while(!feof(fp1))
	{
	if(strcmp(op,"+")==0)
	{
	fprintf(fp2,"\nMOV R0,%s",arg1);
	fprintf(fp2,"\nADD,%s",arg2);
	fprintf(fp2,"\nMOV %s,R0",result);
	}
	if(strcmp(op,"-")==0)
	{
	fprintf(fp2,"\nMOV R0,%s",arg1);
	fprintf(fp2,"\nSUB,%s",arg2);
	fprintf(fp2,"\nMOV %s,R0",result);
	}
	if(strcmp(op,"*")==0)
	{
	fprintf(fp2,"\nMOV R0,%s",arg1);
	fprintf(fp2,"\nMUL,%s",arg2);
	fprintf(fp2,"\nMOV %s,R0",result);
	}
	if(strcmp(op,"/")==0)
	{
	fprintf(fp2,"\nMOV R0,%s",arg1);
	fprintf(fp2,"\nDIV,%s",arg2);
	fprintf(fp2,"\nMOV %s,R0",result);
	}
	if(strcmp(op,"=")==0)
	{
	fprintf(fp2,"\nMOV R0,%s",arg1);
	fprintf(fp2,"\nMOV %s,R0",result);
	}
	fscanf(fp1,"%s%s%s%s",op,arg1,arg2,result);
	}
	fclose(fp1);
	fclose(fp2);
}
	

