import { Select, Table } from 'antd';
import 'antd/dist/antd.css';
import axios from 'axios';
import { useEffect, useState } from 'react';

const { Option } = Select;

const GetDealInfo = ({ company }) => {

    const [dealInfo, setDealInfo] = useState([])

    useEffect(() => {
      axios.post('../company_information', {     //某個function，傳入公司資料，便回傳剩下所需資訊
        "Company": company
      })
      .then((res) => { 
        setDealInfo(res.data)
      })
      .catch((error) => { console.log(error) })
    },[])
    
    const columns = [
      {
        title: 'EPS',
        dataIndex: 'eps',
        key: 'eps',
      },
      {
        title: '本益比',
        dataIndex: 'roe',
        key: 'roe',
      },
      {
        title: '現金殖利率',
        dataIndex: 'Dividend_yield',
        key: 'Dividend_yield',
      }
    ];

      return(
        <Table columns={columns} dataSource={dealInfo} />
      );

}



export default GetDealInfo