#include <iostream>
#include <string>
#include <vector>
#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <algorithm>
#include <map>
#include <stack>
#include <queue>
#include <set>

using namespace std;
#define vsort(v) sort(v.begin(), v.end());

int main(){
	cin.tie(0);
	ios::sync_with_stdio(false);

	int X;
	cin >> X;
	bool array[X+1];
	for(int i = 0;i <= X; i++) array[i] = false;

	for(int i = 2; i <= X; i++) {
		int tmp = i * i;
		while(tmp <= X) {
			array[tmp] = true;
			tmp *= i;
		}
	}
	for(int i = X; i >= 1; i--) {
		if(array[i]) {
			cout << i << endl;
			return 0;
		}
	}
	cout << 1 << endl;
	return 0;
}
