import axios from 'axios';
import { useState, useEffect } from 'react';
import { Space, Button } from 'antd'

const Register = ({ userID, password, name, phone, setRegister, setMenuset, setRegisterPage }) => {

  const [registerStr, setRegisterStr] = useState();

  useEffect(() => {
    axios.post('http://127.0.0.1:8000/api/signup', {         //某種function，傳入使用者帳密進入資料庫中，並確認是否有重複使用者ID(假設回傳一個字串)
      "iname": name,
      "acct_no": userID,
      "pwd": password,
      "phone": phone
    })
    .then((res) => { 
      setRegisterStr(res.data)
    })
    .catch((error) => { console.log(error) })
  },[])

  return <>
    {registerStr == 'Successfully signed up.'?
    <Button onClick={()=>{setRegister(false); setMenuset(true);}}>註冊成功，進入主頁面</Button>:
    <Button onClick={()=>{setRegister(false); setRegisterPage(true);}}>註冊失敗，返回註冊頁</Button>}
    <p>{registerStr}</p>
  </>
}

export default Register