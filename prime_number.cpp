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

#define MAX_V 1000000

bool is_prime(int n) {
	for(int i = 2; i * i <= n; i++) {
		if(n % i == 0) return false;
	}
	return n != 1;
}

vector<int> divisor(int n) {
	vector<int> res;
	for(int i = 1; i * i <= n; i++) {
		if(n % i == 0) {
			res.push_back(i);
			if(i != n / i) res.push_back(n / i);
		}
	}
	return res;
}

map<int, int> prime_factor(int n) {
	map<int, int> res;
	for(int i = 2; i * i <= n; i++) {
		while(n % i == 0) {
			++res[i];
			n /= i;
		}
	}
	if(n != 1) res[n] = 1;
	return res;
}

int eratosthenes(int n) {
	bool is_prime[n + 1];
	memset(is_prime, true, sizeof(is_prime));
	// prime[n];

	is_prime[0] = is_prime[1] = false;
	int ans = 0;
	rep(i, 2, n + 1) {
		if(is_prime[i]) {
			// prime[ans++] = i;
			ans++;
			for(int j = 2 * i; j <= n; j += i) is_prime[j] = false;
		}
	}
	return ans;
}

int main(){
	cin.tie(0);
	ios::sync_with_stdio(false);
	int n;
	cin >> n;
	int rsl = eratosthenes(n);
	cout << rsl << endl;
}
