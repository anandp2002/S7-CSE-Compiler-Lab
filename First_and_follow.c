#include<stdio.h>
#include<string.h>
#include<ctype.h>

int n, m = 0, i = 0, j = 0;
char a[10][10], f[10];

void follow(char c);
void first(char c);

int main() {
    int i, z;
    char c;

    printf("Enter the no of productions:\n");
    scanf("%d", &n);

    printf("Enter the productions:\n");
    for (i = 0; i < n; i++)
        scanf("%s", a[i]);

    do {
        m = 0;
        printf("Enter the elements whose first & follow are to be found:");
        scanf(" %c", &c);

        first(c);
        printf("First(%c)={", c);
        for (i = 0; i < m; i++)
            printf("%c", f[i]);
        printf("}\n");

        strcpy(f, " ");
        m = 0;
        follow(c);
        printf("Follow(%c)={", c);
        for (i = 0; i < m; i++)
            printf("%c", f[i]);
        printf("}\n");

        printf("Continue(0/1)?");
        scanf("%d", &z);
    } while (z == 1);

    return 0;
}

void first(char c) {
    int i;
    if (!isupper(c))
        f[m++] = c;
    for (i = 0; i < n; i++) {
        if (a[i][0] == c) {
            if (a[i][2] == '$')            
                f[m++] = a[i][2];
            else if (islower(a[i][2]))
                f[m++] = a[i][2];
            else
                first(a[i][2]);
        }
    }
}

void follow(char c) {
    if (a[0][0] == c)
        f[m++] = '$';
    for (i = 0; i < n; i++) {
        for (j = 2; j < strlen(a[i]); j++) {
            if (a[i][j] == c) {
                if (a[i][j + 1] != '\0')
                    first(a[i][j + 1]);
                if (a[i][j + 1] == '\0' && c != a[i][0])
                    follow(a[i][0]);
            }
        }
    }
}