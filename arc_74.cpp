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
#define vunique(v) v.erase(unique(v.begin(), v.end()), v.end())
#define mp make_pair
#define ts(x) to_string(x)
#define rep(i, a, b) for(int i = (int)a; i < (int)b; i++)
#define repm(i, a, b) for(int i = (int)a; i > (int)b; i--)
#define bit(a) bitset<8>(a)
#define des_priority_queue priority_queue<int, vector<int>, greater<int> >
typedef long long ll;
typedef pair<int, int> P;
const ll INF = 1e18;

#define MAX_V 1000000

int main(){
	cin.tie(0);
	ios::sync_with_stdio(false);

	ll N;
	cin >> N;
	ll a[3 * N];
	rep(i, 0, 3 * N) cin >> a[i];

	priority_queue<ll> pq1, pq2;
	ll tmp1[N], tmp2[N];
	memset(tmp1, 0, sizeof(tmp1));
	memset(tmp2, 0, sizeof(tmp2));
	rep(i, 0, N) {
		tmp1[0] += a[i];
		pq1.push(a[i]);
	}
	for(int i = 3 * N; i >= 2 * N; i--) {
		tmp2[0] += a[i];
		pq2.push(-a[i]);
	}

	rep(i, 1, N) {
		ll v = pq1.top();
		pq1.pop();
		tmp1[i] = tmp[i - 1] + (v - max(v, a[i + N]));
		pq.push(max(v, a[i + N]));
	}




}
