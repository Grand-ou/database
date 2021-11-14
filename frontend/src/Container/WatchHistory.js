import '../App.css'
import { Space, Button } from 'antd'
import History from '../Component/History'

const WatchHistory = ({ userID, setWatchHistory, setClickCreate }) => {

    return(
        <div className='profit-loss'>
            <History userID={userID} />
            <Button onClick={()=>{setWatchHistory(false); setClickCreate(true);}}>回上頁</Button>
        </div>
    )
}

export default WatchHistory