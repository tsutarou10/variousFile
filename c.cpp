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
#define vunique(v) unique(v.begin(), v.end());


int main(){
	cin.tie(0);
	ios::sync_with_stdio(false);
	string s;
	int K;
	cin >> s;
	cin >> K;
	vector<string> subStr;

	for(int i = 0; i < s.size(); i++) {
		for(int j = 1; j <= K; j++) {
			subStr.push_back(s.substr(i, j));
		}
	}
	vsort(subStr);
	vunique(subStr);
	cout << subStr[K - 1] << endl;
}
