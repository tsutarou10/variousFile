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
	int a, b, c, d;
	cin >> a >> b >> c >> d;

	if(abs(a - c) <= d) {
		cout << "Yes" << endl;
		return 0;
	}

	if(abs(a - b) <= d and abs(b - c) <= d) {
		cout << "Yes" << endl;
		return 0;
	}
	cout << "No" << endl;
}
