import '../App.css'
import { Space, Button } from 'antd'
import User from '../Component/User'

const Login_Register = ( { setUserID, setPassword, setLogin, setRegister, setLR } ) => {

    return (
        <div className='login_register'>
            <h1>登入與註冊</h1>
            <User setUserID={setUserID} setPassword={setPassword} />
            <Button onClick={()=>{setLogin(true); setLR(false);}}>登入</Button>
            <Button onClick={()=>{setRegister(true); setLR(false)}}>註冊</Button>
        </div>
    )

}

export default Login_Register