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
typedef long long ll;
typedef pair<int, int> P;
const ll INF = 1e18;

int main(){
	cin.tie(0);
	ios::sync_with_stdio(false);

	int N;
	cin >> N;
	int a[N];
	rep(i, 0, N) cin >> a[i];

	ll dp[N];
	ll inf = 1e18;
	fill(dp, dp + N, inf);
	ll res = 0;
	rep(i, 0, N) {
		*lower_bound(dp, dp + N, a[i]) = a[i];
	}
	cout << lower_bound(dp, dp + N, inf) - dp << endl;


}
