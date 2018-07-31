import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import InputForm from './components/input_form';
import 'semantic-ui-css/semantic.min.css';

class App extends Component {
  render() {
    return (
      <div>
        <InputForm />
      </div>
    );
  }
}

export default App;
