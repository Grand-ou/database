import '../App.css'
// import { Space, Button } from 'antd'
import User_register from '../Component/User_register'

const RegisterPage = ( { setUserID, setPassword, setName, setPhone, setRegisterPage, setRegister, setLR } ) => {

    return (
        <div className='login_register'>
            <h1>登入與註冊</h1>
            <User_register setUserID={setUserID} setPassword={setPassword} setName={setName} setPhone={setPhone} setRegister={setRegister}/>
            <div class = 'login_button'>
            <div  onClick={()=>{setRegister(true); setRegisterPage(false)}}>註冊</div>
            </div>
            <div class = 'login_button'>
            <div onClick={()=>{setLR(true); setRegisterPage(false);}}>回上頁</div>
            </div>
            
        </div>
    )

}

export default RegisterPage