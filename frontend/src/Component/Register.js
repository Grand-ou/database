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
    <h1>登入與註冊</h1>
    {registerStr == 'Successfully signed up.'?
    <Button onClick={()=>{setRegister(false); setLR(true);}}>註冊成功，返回登入頁</Button>:
    <Button onClick={()=>{setRegister(false); setRegisterPage(true);}}>帳號已被使用，返回註冊頁</Button>}
  </>
}

export default Register