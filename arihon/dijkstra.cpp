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
#define INF 10000000
#define MAX_V 100000
typedef long long ll;
typedef pair<int, int> P;

//int cost[MAX_V][MAX_V];
int d[MAX_V];
//bool used[MAX_V];
int V;
struct edge {
	int to, cost;
};
vector<edge> G[MAX_V];

// O(|V^2|)
/*void dijkstra(int s) {
	fill(d, d + V, INF);
	fill(used, used + V, false);
	d[s] = 0;

	while(true) {
		int v = -1;
		rep(u, 0, V) {
			if(!used[u] && (v == -1 || d[u] < d[v])) v = u;
		}
		if(v == -1) break;
		used[v] = true;
		rep(u, 0, V) d[u] = min(d[u], d[v] + cost[u]);
	}
}*/

// O(ElogV)
void dijkstra(int s) {
	fill(d, d + V, INF);
	d[s] = 0;
	priority_queue<P, vector<P>, greater<P> > q;
	q.push(make_pair(0, s)); // distance, index)

	while(!q.empty()) {
		P p = q.top();
		q.pop();
		int v = p.second;
		if(d[v] < p.first) continue;
		rep(i, 0, G[V].size()) {
			edge e = G[v][i];
			if(d[e.to] > d[v] + e.cost) {
				d[e.to] = d[v] + e.cost;
				q.push(P(d[e.to], e.to));
			}
		}
	}
}


int main(){
	cin.tie(0);
	ios::sync_with_stdio(false);
}
