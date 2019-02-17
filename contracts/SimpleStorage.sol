pragma solidity ^0.5.0;

contract SimpleStorage {
  // 留言结构体
  struct Message {
    string word; // 留言
    address from; // 留言者地址
    string timestamp ; // 留言unix时间戳
  }

  //定义数组
  Message[] private wordAdrr;

  /**
     * 写入留言的方法
     */
  function setWord(string s, string t) public {
    wordArr.push(Message({
      word: s,
      from: msg.sender,
      timestamp: t
      }));
  }

  /**
     * 获取随机留言的方法
     */
  function getRandomWord(uint random) public view returns (uint, string, address, string) {
    if(wordArr.length==0){
      return (0, "", msg.sender, "");
    }else{
      Message storage result = wordArr[random];
      return (wordArr.length, result.word, result.from, result.timestamp);
    }
  }
}
