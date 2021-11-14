import GetDealInfo from '../Component/GetDealInfo';


const DealInfo = ({ company }) => {

    return(
        <div className='schedule'>
            <GetDealInfo company={company} />
        </div>
    )
}

export default DealInfo