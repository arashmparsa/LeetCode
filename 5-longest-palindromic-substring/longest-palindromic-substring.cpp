class Solution {
public:
    string longestPalindrome(string s) {
        if (s.empty()) return "";
        
        string longest = "";
        
        for (int i = 0; i < s.length(); i++) {
            // Odd length palindromes (single char center)
            string pal1 = expandAroundCenter(s, i, i);
            if (pal1.length() > longest.length()) {
                longest = pal1;
            }
            
            // Even length palindromes (two char center)
            string pal2 = expandAroundCenter(s, i, i + 1);
            if (pal2.length() > longest.length()) {
                longest = pal2;
            }
        }
        
        return longest;
    }
    
private:
    string expandAroundCenter(string& s, int left, int right) {
        while (left >= 0 && right < s.length() && s[left] == s[right]) {
            left--;
            right++;
        }
        // Return substring from (left+1) with length (right-left-1)
        return s.substr(left + 1, right - left - 1);
    }
};