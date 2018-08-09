import React, { Component } from 'react'
import { Container, Button, Checkbox, Form, Segment } from 'semantic-ui-react'
import CreditCardInput from 'react-credit-card-input';
import axios from 'axios';

class InputForm extends Component {
    
    constructor(props) {
        super(props);
        this.state = {
            // payment: {
            order_id: '',
            first_name: 'Hector',
            last_name: 'Toro',
            ccNumber: '4111 1111 1111 1111',
            //ccMonth: '',
            ccExp: '11/2021',
            cvv: '999',
            billingAddress: 'Santa Lucia',
            description: 'Compra',
            email: 'htorohn@gmail.com',
            amount: '100.00',
            // },
            focused: true
        };

        this.handleChange = this.handleChange.bind(this)
        this.handleCardNumberChange = this.handleCardNumberChange.bind(this)
        this.handleCardExpiryChange = this.handleCardExpiryChange.bind(this)
        this.handleCardCVCChange = this.handleCardCVCChange.bind(this)

    }

    handleChange = (e, { name, value }) => this.setState({ [name]: value })
    
    handleCardNumberChange(number) {
        this.setState({ccNumber: number.target.value})
    }
    handleCardExpiryChange(number) {
        //console.log(number.target.value)
        this.setState({ccExp: number.target.value})
    }
    handleCardCVCChange(number) {
        this.setState({cvv: number.target.value})
    }

    handleSubmit = () => {
        //console.log(this.state)
        const {order_id, amount, email, ccNumber, ccExp, cvv, billingAddress, description, first_name, last_name} = this.state
        const expDate = ccExp.split('/')
        let payment = {
            order_id:  Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15),
            first_name: first_name,
            last_name: last_name,
            ccNumber: ccNumber.split(' ').join(''),
            //ccMonth: '',
            ccMonth: expDate[0].split(' ').join(''),
            ccYear: expDate[1].split(' ').join(''),
            cvv: cvv,
            billingAddress: billingAddress,
            description: description,
            email: email,
            amount: amount*100,
        }  
        console.log('Payment: ')
        console.log(payment)
        
        axios.post('/api/v1/payments', payment, {
            headers: {
                api_key: 'cd6893c2c2a695f0bb0633de933ec085'
            }
        })
          .then(function (response) {
            console.log(response.data);
          })
          .catch(function (error) {
            console.log(error);
          })
    }
    
    render (){
        //console.log(this.state)
        const {amount, email, ccNumber, ccExp, cvv, billingAddress, description, first_name, last_name} = this.state
        return (
            <Container>
                <Segment style={{marginTop: 50}}>
                    <Form onSubmit={this.handleSubmit}>
                        <Form.Field>
                            <label>Amount</label>
                            <Form.Input 
                                type="number" 
                                placeholder='Amount' 
                                name='amount' 
                                value={amount} 
                                onChange={this.handleChange} 
                            />
                        </Form.Field>
                        <Form.Field>
                            <label>Email</label>
                            <Form.Input 
                                type="email" 
                                placeholder='Email' 
                                name='email' 
                                value={email} 
                                onChange={this.handleChange} 
                            />
                        </Form.Field>
                        <Form.Field>
                            <label>Billing Address</label>
                            <Form.Input 
                                type="text" 
                                placeholder='Billing Address' 
                                name='billingAddress' 
                                value={billingAddress} 
                                onChange={this.handleChange} 
                            />
                        </Form.Field>  
                        <Form.Field>
                            <label>Descriptio</label>
                            <Form.Input 
                                type="text" 
                                placeholder='Description' 
                                name='description' 
                                value={description} 
                                onChange={this.handleChange} 
                            />
                        </Form.Field>   
                        <Form.Group>
                        {/* <Form.Field> */}
                            {/* <label>Descriptio</label> */}
                            <Form.Input 
                                type="text" 
                                placeholder='First Name' 
                                name='first_name' 
                                value={first_name} 
                                onChange={this.handleChange} 
                            />
                            <Form.Input 
                                type="text" 
                                placeholder='Last Name' 
                                name='last_name' 
                                value={last_name} 
                                onChange={this.handleChange} 
                            />
                        {/* </Form.Field> */}
                        </Form.Group>
                        <Form.Field>
                            <CreditCardInput
                                inputStyle={ccStyle}
                                cardNumberInputProps={{ value: ccNumber, onChange: this.handleCardNumberChange }}
                                cardExpiryInputProps={{ value: ccExp, onChange: this.handleCardExpiryChange }}
                                cardCVCInputProps={{ value: cvv, onChange: this.handleCardCVCChange }}
                                fieldClassName="input"
                            />
                        </Form.Field>
                        <Button type='submit'>Submit</Button>
                    </Form>
                </Segment>
            </Container>
        );
    }
}


export default InputForm

const ccStyle = {
    fontSize: 6
}