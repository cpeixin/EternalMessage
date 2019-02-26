pragma solidity ^0.5.0;

contract SimpleStorage {
    // 留言结构体
    struct Message {
        string word; // 留言
        address from; // 留言者地址
        string timestamp ; // 留言unix时间戳
    }

    Message[] private wordAdrr;

    /**
     * 写入留言的方法
     */

  function setWord(string memory s, string memory t) public {
    wordAdrr.push(Message({
      word: s,
      from: msg.sender,
      timestamp: t
      }));
  }

    /**
     * 获取随机留言的方法
     */
  function getRandomWord(uint random) public view returns (uint, string memory, address, string memory) {
    if(wordAdrr.length==0){
      return (0, "", msg.sender, "");
    }else{
      Message memory result  = wordAdrr[random];
      return (wordAdrr.length, result.word, result.from, result.timestamp);
    }
}
}
