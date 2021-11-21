import '../App.css'
import { Space, Button } from 'antd'
import User from '../Component/User_login'

const Login_Register = ( { setUserID, setPassword, setLogin, setRegisterPage, setLR } ) => {

    return (
        <div class='login_register'>
            <h1>登入與註冊</h1>
            <User setUserID={setUserID} setPassword={setPassword} setLogin={setLogin} />
            <div class = 'login_button'>
            <div onClick={()=>{setLogin(true); setLR(false);}}>登入</div>
            </div>
            <div class = 'login_button'>
            <div onClick={()=>{setRegisterPage(true); setLR(false)}}>註冊</div>
            </div>
        </div>
    )

}

export default Login_Register