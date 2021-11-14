import '../App.css'
import { Space, Button } from 'antd'

const MenuSet = ( { setClickDeal, setClickCreate, setMenuset } ) => {

    return (
        <div className='header'>
            <h1>某種標題</h1>
            <Space className='menu-set'>
                <Button onClick={()=>{setClickDeal(true); setMenuset(false);}}>個股資訊</Button>
                <Button onClick={()=>{setClickCreate(true); setMenuset(false);}}>創建投資組合</Button>
            </Space>
        </div>
    )

}

export default MenuSet