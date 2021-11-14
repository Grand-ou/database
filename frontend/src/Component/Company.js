import { Select, Space } from 'antd';
import 'antd/dist/antd.css';
//import axios from 'axios';
import { useEffect, useState } from 'react';

const { Option } = Select;

const Companies = ({ setCompany, setClickCheck }) => {

    const [target, setTarget] = useState([])

    /*useEffect(() => {
        axios.get('http://127.0.0.1:8000/api/companies')
        .then((res) => { 
          setCompanies(res.data)
        })
        .catch((error) => { console.log(error) })
    },[])*/

    const onChange = (value) => {
        console.log(`selected ${value}`);
        setCompany(value)
        setClickCheck(false)
    }
      
    const onSearch = (val) => {
        console.log('search:', val);
    }
      
    return(
        <div>
            <Space className='company'>
                <h3>選擇個股</h3>
                <Select
                style={{ width: 200 }}
                onChange={onChange}
                filterOption={(input, option) =>
                    option.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
                }
                >
                <Option value="台積電">台積電</Option>
                <Option value="元大">元大</Option>
                </Select>
            </Space>
        </div>
      );
}



export default Companies