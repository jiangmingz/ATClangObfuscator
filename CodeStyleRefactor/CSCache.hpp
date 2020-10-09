//
//  CSUtils.hpp
//  CodeStyleRefactor
//
//  Created by likaihao on 2019/12/5.
//

#ifndef CSCache_hpp
#define CSCache_hpp

#include <string>
#include <map>
#include <set>

using namespace std;

class CSCache
{
public:
    bool containClsName(const std::string& clsName);
    void addClsName(const std::string& clsName);
    bool addClsNameSelector(const std::string& clsName, const std::string& selector, const std::string& newSelector);
    
    void addClsNameIntoWhiteList(const std::string& clsName);
    void addClsNameIntoBlackList(const std::string& clsName);
    bool checkWhiteBlackList(const std::string &clsName) const;
    
    bool ignoreSelector(const std::string& selector) const;
    void addIgnoreSelector(const std::string& selector);
    void loadIgnoreSelectors(const std::string &filePath);
    void saveIgnoreSelectors(const std::string &filePath);
    
private:
    //类名:方法列表
    std::map<std::string, std::map<std::string, std::string>> clsMethodMap;
    
    //selector列表
    std::set<std::string> selectorSet;
    
    //白名单
    std::set<std::string> whiteListSet;

    //黑名单
    std::set<std::string> blackListSet;
};

#endif /* CSCache_hpp */
