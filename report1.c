#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define HASH_SIZE 101

int checkPosOrAddr(char*);
int calHashValOfPostal(char*);
int calHashValOfAddress(char*);
void add(int, char*, char*, int);
void printAnything(int, char*, int);
void postToAddr(int, char*);
void addrToPost(int, char*);
void readText();

struct cell {
	char *p_code;  /* 郵便番号*/
	char *address; /*  住所　 */
	struct cell *p_next; /* 郵便番号における次 */
	struct cell *a_next; /* 住所における次 */
};

struct cell *Hash[HASH_SIZE];

//strが住所なら0, 郵便番号なら1を返す
int checkPosOrAddr(char *str) {
	char moji = str[0];
	if(moji >= '0' && moji <= '9') return 1;
	return 0;
}

int calHashValOfPostal(char *post) {
	int hash_val = 0;
	int i;
	for(i = 0; i < strlen(post); i++) {
		hash_val += post[i];
	}
	hash_val %= HASH_SIZE;
	return hash_val;
}

int calHashValOfAddress(char *addr) {
	int hash_val = 0;
	hash_val = strlen(addr);
	hash_val %= HASH_SIZE;
	return hash_val;
}

void add(int hash_val, char *post, char *addr, int a0p1) {
	//		  [ハッシュ値]  [郵便番号]   [住所]  [0: addPost, 1: addAdr]
	struct cell *tmp;
	tmp = malloc(sizeof(struct cell));
	tmp->p_code = malloc(sizeof(char) * strlen(post));
	tmp->address = malloc(sizeof(char) * strlen(addr));
	strcpy(tmp->p_code, post);
	strcpy(tmp->address, addr);
	tmp->p_next = NULL;
	tmp->a_next = NULL;
	
	struct cell *ptr;
	ptr = malloc(sizeof(struct cell));
	ptr = Hash[hash_val];
	if(ptr == NULL) {
		// ハッシュ値に何も入ってないとき
		Hash[hash_val] = malloc(sizeof(struct cell));
		Hash[hash_val] = tmp;
		//ptr = tmp;
	} else {
		if(a0p1 == 0) {
			while(ptr->a_next != NULL) {
				ptr = ptr->a_next;
			}
			ptr->a_next = tmp;
		} else {
			while(ptr->p_next != NULL) {
				ptr = ptr->p_next;
			}
			ptr->p_next = tmp;
		}
	}
}

void printAnything(int hash_val, char *postOrAddr, int a0p1) {
	//a0p1 == 0 -> 郵便番号を出力, a0p1 == 1 -> 住所を出力
	if(a0p1 == 0) {
		addrToPost(hash_val, postOrAddr);
	} else {
		postToAddr(hash_val, postOrAddr);
	}
}

void postToAddr(int hash_val, char *post) {
	// 郵便番号 -> 住所
	struct cell *c;
	c = malloc(sizeof(struct cell));
	c = Hash[hash_val];
	while(c != NULL) {
		if(strcmp(c->p_code, post) == 0) {
			printf("%s\n", c->address);
			return;
		}
		c = c->p_next;
	}
	printf("not found...\n");
}

void addrToPost(int hash_val, char *addr) {
	// 住所 -> 郵便番号
	struct cell *c;
	c = malloc(sizeof(struct cell));
	c = Hash[hash_val];

	while(c != NULL) {
		if(strcmp(c->address, addr) == 0) {
			printf("%s\n", c->p_code);
			return;
		}
		c = c->a_next;
	}
	printf("not found...\n");
}

void readText() {
	double line_of_file = 123798.0;
	char fileName[] = "postal2.txt";
	FILE *fp;
	int f;
	fp = fopen(fileName, "r");
	double current = 0.0;	
	double tmpPer = 0.0;
	double per = 0.0;
	while(1) {
		char post[8];
		char addr[1024];
		f = fscanf(fp, "%s %s", post, addr);
		if(f == EOF) break;
		int hash_val_of_post = calHashValOfPostal(post);
		int hash_val_of_addr = calHashValOfAddress(addr);
		add(hash_val_of_addr, post, addr, 0); // 郵便番号がキー
		add(hash_val_of_post, post, addr, 1); // 住所がキー
		tmpPer = current / line_of_file;
		if(tmpPer >= per + 0.1) {
			per += 0.1;
			printf("%f done.\n", per * 100);
		}
		current += 1.0;
	}
	
	fclose(fp);
	printf("finished reading file!\n");
}

int main() {
	
	int i;
	for(i = 0; i < HASH_SIZE; i++) {
		Hash[i] = NULL;
	}
	
	readText();

	char input_data[1024];
	while(scanf("%s", input_data) != EOF) {
		int a0p1 = checkPosOrAddr(input_data); // 0: 住所を受けとった 1: 郵便番号を受けとった
		int hash_val = 0;
		if(a0p1 == 0) {
			hash_val = calHashValOfAddress(input_data);
		} else {
			hash_val = calHashValOfPostal(input_data);
		}
		printAnything(hash_val, input_data, a0p1);
	}
}

