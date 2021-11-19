import '../App.css'
import { Space, Button } from 'antd'
import { useState } from 'react'
import Register from "../Component/Register";

const Register_Succeed = ( { userID, password, name, phone, setRegister, setMenuset, setRegisterPage } ) => {

    const [registerStr, setRegisterStr] = useState('')

    return (
        <div className='header'>
            <Register userID={userID} password={password} name={name} phone={phone} setRegisterStr={setRegisterStr} />
            {registerStr == 'your account is created.'?
            <Button onClick={()=>{setRegister(false); setMenuset(true);}}>註冊成功，進入主頁面</Button>:
            <Button onClick={()=>{setRegister(false); setRegisterPage(true);}}>註冊失敗，返回註冊頁</Button>}
        </div>
    )

}

export default Register_Succeed