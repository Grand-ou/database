import '../App.css'
import { Space, Button } from 'antd'

const MenuSet = ( { setClickDeal, setClickCreate, setClickInd, setClickCompany } ) => {

    return (
        <div class='header'>
            <div id ='project'>Name</div>
                <div class='button' onClick={()=>{setClickDeal(true); setClickCreate(false); setClickInd(false);}}>個股資訊</div>
                <div class='button' onClick={()=>{setClickCreate(true); setClickDeal(false); setClickCompany(false);}}>創建投資組合</div>
      
        </div>
    )

}

export default MenuSet