#include<stdio.h>
#include<string.h>
#include<ctype.h>
void follow(char c);
void first(char c);
char a[20][20],f[20];
int m,n;

void first(char c)
{
    if(!isupper(c))
        f[m++]=c;
    for(int i=0;i<n;i++)
    {
        if(a[i][0]==c)
        {
                if(a[i][2]=='$')
                    follow(a[i][0]);
                else if(islower(a[i][2]))
                {
                    f[m++]=a[i][2];
                }
                else
                    first(a[i][2]);
        }
    }
}

void follow(char c)
{
    if(a[0][0]==c)
        f[m++]='$';
    for(int i=0;i<n;i++)
    {
             for(int j=2;j<strlen(a[i]);j++)
             {
                 if(a[i][j]==c)
                 {
                     if(a[i][j+1]!='\0')
                        first(a[i][j+1]);
                     if(a[i][j+1]=='\0' && a[i][0]!=c)
                        follow(a[i][0]);

                 }
             }

    }
}

void main()
{
    char c,z;

    printf("\nEnter the no of production");
    scanf("%d",&n);

    printf("\nEnter the production");

    for(int i=0;i<n;i++)
    {
        scanf("%s",a[i]);
    }
    do{
    m=0;
    printf("\nEnter the symbol");
    scanf(" %c",&c);

    first(c);

    printf("\nFirst(%c)={",c);
    for(int i=0;i<m;i++)
    {
        printf(" %c",f[i]);
    }
    printf("}");

    strcpy(f,"");
    m=0;
    follow(c);
    printf("\nFollow(%c)={",c);

    for(int i=0;i<m;i++)
    {
        printf(" %c",f[i]);
    }
    printf("}");
    
    printf("continue(y/n)");
    scanf("%c",&z);
    }while(z=='y');
    
    
}

