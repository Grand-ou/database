import '../App.css'
import { Space, Button } from 'antd'
import { useState } from 'react'
import Login from "../Component/Login";

const Login_Succeed = ( { userID, password, setLogin, setMenuset, setLR } ) => {

    const [loginStr, setLoginStr] = useState('')

    return (

        <div class='login_register'>
        <h1 >登入與註冊</h1>
        <Login userID={userID} password={password} setLoginStr={setLoginStr} />
            {loginStr == 'Successfully logged in.'?
            <Button onClick={()=>{setLogin(false); setMenuset(true);}}>登入成功，進入主頁面</Button>:
            <Button onClick={()=>{setLogin(false); setLR(true);}}>登入失敗，返回註冊頁</Button>}
        </div>

    )

}

export default Login_Succeed