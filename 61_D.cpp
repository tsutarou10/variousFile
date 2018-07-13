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
#include <cstring>

using namespace std;
#define vsort(v) sort(v.begin(), v.end());
#define asort(array) sort(array.begin(), array.end())
#define vunique(v) unique(v.begin(), v.end());
#define MAX_V 1000
#define INF -2000000000
array<int, MAX_V> d;
struct edge {
	int from, to, cost;
};

int main(){
	cin.tie(0);
	ios::sync_with_stdio(false);
	
	int N, M;
	cin >> N >> M;
	fill(d, d + N, INF);
	d[0] = 0; // start

	edge E[M];

	for(int i = 0; i < M; i++) {
		int a, b, c;
		cin >> a >> b >> c;
		E[i].from = a;
		E[i].to = b;
		E[i].cost = c;
	}

	for(int i = 1; i < N; i++) {
		for(int j = 0; j < M; j++) {
			edge e = E[j];
			d[e.to] = max(d[e.to], d[e.from] + e.cost);
			if(i == N - 1) {
				cout << "inf" << endl;
				return 0;
			}
		}
	}
	asort(d);
	cout << d[N - 1] << endl;
}
