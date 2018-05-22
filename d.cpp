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
#define vfind(v, number) find(v.begin(), v.end(), number)

int main(){
	cin.tie(0);
	ios::sync_with_stdio(false);
	
	int N, M;
	cin >> N >> M;
	int p[N];
	map <int, int> XY;
	for(int i = 0; i < M; i++) {
		int x, y;
		cin >> x >> y;
		XY.insert(make_pair(x, y));
	}
	for(map::iterator X = m.begin(); X != m.end(); X++) {
		cout << X.first << endl;
		cout << X.second << endl;
	}
}
