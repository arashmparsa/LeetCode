class Solution {
public:
    int minNumberOperations(vector<int>& target) {
        int operations = 0;
        int prev = 0;
        
        for (int num : target) {
            if (num > prev) {
                operations += num - prev;
            }
            prev = num;
        }
        
        return operations;
    }
};