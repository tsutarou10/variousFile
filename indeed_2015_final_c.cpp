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

	int N, M;
	cin >> N >> M;
	int a[N], b[N], c[N], w[N];
	rep(i, 0, N) cin >> a[i] >> b[i] >> c[i] >> w[i];
	int x[M], y[M], z[M];
	rep(i, 0, M) cin >> x[i] >> y[i] >> z[i];
	int dp[102][102][102];
	memset(dp, 0, sizeof(dp));
	rep(i, 0, N) dp[a[i]][b[i]][c[i]] = max(dp[a[i]][b[i]][c[i]], w[i]);

	rep(i, 0, 101) rep(j, 0, 101) rep(k, 0, 101) {
		dp[i + 1][j][k] = max(dp[i][j][k], dp[i + 1][j][k]);
		dp[i][j + 1][k] = max(dp[i][j + 1][k], dp[i][j + 1][k]);
		dp[i][j][k + 1] = max(dp[i][j][k + 1], dp[i][j][k + 1]);
	}

	rep(i, 0, M) {
		cout << dp[x[i]][y[i]][z[i]] << endl;
	}
	
}
