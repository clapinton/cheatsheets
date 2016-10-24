// REDUX


// ***** store.js
// • Wraps the app state with a minimalist API:
//   • getState();
//   • dispatch(action);
//   • subscribe(listener);

import { createStore } from 'redux';
import reducer from './reducer.js'

const Store = createStore(reducer); //this will give you the #dispatch and #getState
// const Store = createStore(rootReducer); //if you have more than one reducer


// ***** root_reducer.js
// Needed if you have more than one reducer
import { combineReducer } from 'redux';
import firstReducer from 'firstReducer.js'

const rootReducer = combineReducer({
  first: firstReducer
})

export default rootReducer;

// ***** firstReducer.js
// You should have one reducer to handle each state slice, like one for fruits and one for farmers

const defaultValue = {/*...*/}

//Triggered by store.dispatch()
//NEVER mutate the state or action
const reducer (oldState = defaultValue, action) => {
  switch (action.type)
  case
    // ...
  default:
    return oldState;
}



// ***** actions.js -

const ADD_SOMETHING = "ADD_SOMETHING";

export const addSomething = (some_value) => ({
  type: ADD_SOMETHING,
  value: some_value
})

export const addSomethingElse = (some_other_value) => ({
  type: ADD_SOMETHING,
  value: some_other_value
})





//REACT
// ***** entry.js
import store from './store'
import {addSomething, addSomethingElse} from './actions'

import AppNameContainer from './components/container.js'
import { Provider } from 'react-redux'

//To test, add any method to window/global here

const App = ({ store }) =>
  <Provider store={store}>  //Provider (from react-redux npm) passes the store to any of its subcomponents
    <AppNameContainer />
  </Provider>
);

//addEventListener to DOMContentLoaded and render <App store={ store }/> on targeted div




// ***** container.js
import { connect } from 'react-redux';
import { method1, method2, method3} from 'actions'
import AppName from 'appname'; //This is the presentational component

const mapStateToProps = state => ({ //returns a props object, made from state values
  //The state here comes from the store, passed through the #connect from the Provider
  someProp: state.someProp
});

const mapDispatchToProps = dispatch => ({
  addSomething: () => dispatch(addSomething()),
  addSomethingElse: () => dispatch(addSomethingElse())
})

//This uses a currying pattern
export default connect( //Connects the Container to the Presentational
  //This receives the store from the Provider on entry.js
  mapDispatchToProps,
  mapStateToProps //through
)(AppName); //jsx destination


// ***** appname.jsx
import React

const AppName = (props) => { //deconstruct the props so you don't need to keep calling props
//At this point, props has 3 keys: addSomething, addSomethingElse and someProp
  <div>
    //Render something from props

    <button onclick={props.addSomething}>Add Something</button>
    <button onclick={props.addSomethingElse}>Add Something Else</button>

  </div>
}
