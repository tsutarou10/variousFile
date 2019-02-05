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
// ascending order
#define vsort(v) sort(v.begin(), v.end())
// descending order
#define vsort_r(v) sort(v.begin(), v.end(), greater<int>())
#define vunique(v) unique(v.begin(), v.end())
#define mp make_pair
#define ts(x) to_string(x)
#define rep(i, a, b) for(int i = (int)a; i < (int)b; i++)
#define repm(i, a, b) for(int i = (int)a; i > (int)b; i--)
#define bit(a) bitset<8>(a)
#define des_priority_queue priority_queue<int, vector<int>, greater<int> >
typedef long long ll;
typedef pair<int, int> P;
const ll INF = 1e18;

int main(){
	cin.tie(0);
	ios::sync_with_stdio(false);

	int N, M;
	cin >> N >> M;

	int graph[N][N];
	memset(graph, 0, sizeof(graph));

	rep(j, 0, M) {
		int u, v;
		cin >> u >> v;
		u--; v--;
		graph[u][v] = 1;
		graph[v][u] = 1;
	}

	bool reached[N];
	memset(reached, false, sizeof(reached));

	int rsl = 0;

	rep(i, 0, N) {
		if(not reached[i]) {
			reached[i] = true;
			stack<int> s;
			s.push(i);
			bool flag = true;
			while(!s.empty()) {
				int curr_pos = s.top();
				s.pop();
				rep(j, 0, N) {
					if(graph[curr_pos][j] == 1) { 
						graph[curr_pos][j] = 0;
						graph[j][curr_pos] = 0;
						if(reached[j]) {
							flag = false;
							break;
						} else {
							reached[j] = true;
							s.push(j);
						}
					} 
				}
				if(not flag) break;
			}
			if(flag) rsl++;
		}
	}
	cout << rsl << endl;
}
