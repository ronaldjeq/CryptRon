/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import { StyleSheet,  Text, View, TouchableOpacity, TextInput } from 'react-native';
//import AppButton from './aplication/Components/AppButton';
import BackgroundImage from './aplication/Components/BackgroundImage';
import Orientation from 'react-native-orientation';
export default class App extends Component{


  componentWillMount() {
    // The getOrientation method is async. It happens sometimes that
    // you need the orientation at the moment the JS runtime starts running on device.
    // `getInitialOrientation` returns directly because its a constant set at the
    // beginning of the JS runtime.
 this.setState({ 
  searchtext:'',
  textEncript:'',
  textInitial:'',
      })
  }


componentDidMount(){
  this.setState({ 
    Textenc:'hsdasdsa',
        })
}
  

encript(){
  const grupo1 = [];
  const grupo2 = [];
  const grupo3 = [];

  const abcInitial= [ 'a', 'b', 'c', 'd', 'e', 'f', 'g','h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ','o','p','q' ,'r',
        's','t','u','v','w','x','y','z', '0', '1','2','3','4','5','6','7','8','9'];
  const letras= [ 'a', 'b', 'c', 'd', 'e', 'f', 'g','h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ','o','p','q' ,'r',
        's','t','u','v','w','x','y','z']

letras.map( (item, key) => {

    if(key<6){
     grupo1.push(item);
   }
   else if(key<19){
    grupo2.push(item);
  }
  else {
    grupo3.push(item);
  }
 })
   const listLetters1 = this.substitution(grupo1);
   const listLetters2 =this.invert(grupo2);
   const listLetters3 = this.transp(grupo3);
   
   this.addNumbers(listLetters1,listLetters2,listLetters3,abcInitial);
}

substitution(item){
  const number= [3,5,2];
  const keyp = ['d','i','i', 'd'];
  let newitem=item;
  let nnumber=0;
  let nkey=0;
  const newnumber=[];
  const newkeyp=[];
  let indice=0;
  const cript= [];
  let t;
  item.map( (letter, key) => {
    if( nkey > keyp.length-1){
      nkey=0;
    }
    if( nnumber > number.length-1){
      nnumber=0;
    }

    newnumber.push(number[nnumber]);
    newkeyp.push(keyp[nkey]);

    nnumber=nnumber+1;
    nkey=nkey+1;
  })
  while (indice < newnumber.length){
    if(newitem.length === 1){
      t=0;
    }
    else {
      if(indice ===0) {

        t = newnumber[indice]%newitem.length;
        }
      else {
          if( newkeyp[indice]==='i'){
              if( t < (newnumber[indice]%newitem.length)){
                t =  t -  newitem.length +  (newnumber[indice]%newitem.length);
              }
              else {
                t= t - (newnumber[indice]%newitem.length);
              }       
          }
          else {
            if ((newnumber[indice]%(newitem.length+1)) + t > newitem.length ){
              t =  t + (newnumber[indice]%(newitem.length+1)) - (newitem.length) -1 ;
            }
            else {
              t= t + (newnumber[indice]%newitem.length);
            }
               }
          }

    }

    cript.push(newitem[t]);
    newitem.splice(newitem.indexOf(newitem[t]), 1);
    indice=indice+1;
  }
  return(cript);
}

invert(grupo2){
  return grupo2.reverse();
}

transp(grupo3){
  const narray= [ 7,4,1,9];
  const l = Math.floor(grupo3.length/narray.length);
  const resto= grupo3.length%narray.length;
  const letters = [];
  const restarrayLetters = {};
  let t=0;
  let restt=0;
  while (t<l){
    const arrayLetters = {}
    narray.map((item, key) => {
      arrayLetters[item] = grupo3[key+t*narray.length];
    })
    
    Object.keys(arrayLetters).map((items, key) => {
      letters.push(arrayLetters[items]);
    })
    t=t+1;
  }

  while (restt<resto){
    const letter = narray[restt];
    const  item =  letters.length + restt; 
    restarrayLetters[letter] = grupo3[item];
    restt=restt+1;
  }
  Object.keys(restarrayLetters).sort().map((items, key) => {
    letters.push(restarrayLetters[items]);
  })
  return letters;
}

addNumbers(listLetters1,listLetters2,listLetters3,abcInitial){
  const {searchtext} = this.state;
  const arrayFinalCrypto=[];
  const numberList=[9,7,5,3,1,8,6,4,2,0];
  const objectLettersChangue={};
  const objectLettersInitial={};
  listLetters1.map((items, key) => {
    arrayFinalCrypto.push(items);
  })
  listLetters2.map((items, key) => {
    arrayFinalCrypto.push(items);
  })
  listLetters3.map((items, key) => {
    arrayFinalCrypto.push(items);
  })
  const orderLetter = arrayFinalCrypto.indexOf("l");

  numberList.map( (item, key)=> {
    arrayFinalCrypto.splice(orderLetter + key + 1 , 0, item );
  })



  const textoEncriptColumns = [];
  

  searchtext.split(' ').map((item, key)=> {
    
/*     if( t < (newnumber[indice]%newitem.length)){
      t =  t -  newitem.length +  (newnumber[indice]%newitem.length);
    }
    else {
      t= t - (newnumber[indice]%newitem.length);
    }  
    
    if( t < (newnumber[indice]%newitem.length)){
      t =  t -  newitem.length +  (newnumber[indice]%newitem.length);
    }
    else {
      t= t - (newnumber[indice]%newitem.length);
    }   */
    let indicatorElement=0;
    while( indicatorElement < arrayFinalCrypto.length   ){
      console.warn('hi');
      

    }


    arrayFinalCrypto.map( (item, key)=> {
      objectLettersChangue[abcInitial[key]]= item;
    })
  
    abcInitial.map( (item, key)=> {
      objectLettersInitial[arrayFinalCrypto[key]]= item;
  
    })

    let n=0;
    const textoEncript = []; 
    while (n < item.length  ){
      const Text= objectLettersChangue[item[n]];
      textoEncript.push(Text);
       n=n+1
     }
     textoEncript.push(' ');

     textoEncriptColumns.push(textoEncript.join('') )

  })
/*    while( t < searchtext.split(' ').length){
    console.warn('hi')
    t=t+1
  }  */
/*   while (n< searchtext.length  ){
   const Text= objectLettersChangue[searchtext[n]];
   textoEncript.push(Text);
    n=n+1
  }  */
  console.warn('texto',textoEncriptColumns.join(''));
/*   console.warn('objectLettersChangue',objectLettersChangue);
  console.warn('objectLettersInitial',objectLettersInitial); */

}

  render() {
    // ...
 const {Textenc} = this.state;
    return (
     <View>
       <Text>Encríptamelo</Text>
       <Text>Hola mundo</Text>
       <TextInput       placeholder="placeholder"
                        value={this.state.searchtext}
                        onChangeText={searchtext =>
                            this.setState({ searchtext })
                        }
                        ref={input => {
                            this.textInput = input;
                        }}
                        returnKeyType="go" />
       <Text>{Textenc}</Text>
       <Text>{Textenc}</Text>
        <TouchableOpacity onPress={() => this.encript()} >
         <Text style = {{backgroundColor:'red'}}>Encriptar</Text>
       </TouchableOpacity>
     </View>
    );
  }
}



