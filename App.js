/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import { Dimensions,  Text, View, TouchableOpacity, TextInput, Image,ScrollView } from 'react-native';
import AppButton from './aplication/Components/AppButton';
//import AppButton from './aplication/Components/AppButton';

const style = {
  container:{
    backgroundColor:'#E6E6FA',
    height:'100%',
    width:'100%'
  },
  Image:{
    marginTop:-30,
    height:300,
    width: 420,
  },
  tittle:{
    marginTop:-10,
    color:'#0000FF',
    fontSize:30,
    textAlign:'center',
  },
  textencript:{
    flex:1,
    backgroundColor:'#2EFE2E',
    fontSize:15,
    fontWeight:'bold',
  },

  textInitial:{
    flex:1,
    backgroundColor:'red',
    fontSize:15,
    fontWeight:'bold',
  },
  button:{
    backgroundColor:'#8181F7',
    width:100,
    height:30,
    borderRadius:20,
    justifyContent:'center',
    alignItems:'center',
    marginVertical:10,
    marginHorizontal:150,
  },

  textButton:{
    fontSize:15,
    fontWeight:'bold',
  },

  contentchangeNumber:{
    flexDirection:'row',
    alignItems:'center',
    //justifyContent:'center',


  }


}
export default class App extends Component{


  componentWillMount() {
 this.setState({ 
  searchtext:'',
  textEncript:'',
  textInitial:'',
  textsee:'',
  activeText:false,
  arrayCriptoActual:[],
  number1:9,
  number2:9,
  number3:9,
  changue:false,
  Initialabc: [ 'a', 'b', 'c', 'd', 'e', 'f', 'g','h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ','o','p','q' ,'r',
  's','t','u','v','w','x','y','z', '0', '1','2','3','4','5','6','7','8','9']
      })
  }


componentDidMount(){
  this.setState({ 
    Textenc:'hsdasdsa',
        })
}
  
componentDidUpdate( prevState ) {
  if (  this.state.changue ===true ) {
      const numberRest= 27- this.state.number1- this.state.number2;
      this.setState({number3:numberRest,changue:false });

      // return response
  }
}

encript(){
  const grupo1 = [];
  const grupo2 = [];
  const grupo3 = [];

  const abcInitial= this.state.Initialabc;
  const letras= [ 'a', 'b', 'c', 'd', 'e', 'f', 'g','h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ','o','p','q' ,'r',
        's','t','u','v','w','x','y','z']
const {number1, number2}= this.state;
//Asing letters into arraysgroups
letras.map( (item, key) => {

    if(key<number1){
     grupo1.push(item);
   }
   else if(key<number2+number1){
    grupo2.push(item);
  }
  else {
    grupo3.push(item);
  }
 })
   const listLetters1 = this.substitution(grupo1);
   const listLetters2 =this.invert(grupo2);
   const listLetters3 = this.transp(grupo3);
   
 const criptoArray =  this.addNumbers(listLetters1,listLetters2,listLetters3,abcInitial);
 const encodeDinamic= this.encode(criptoArray, abcInitial);
 return encodeDinamic;
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

    


    
  })
  while (indice < newnumber.length){
    console.warn(indice,newnumber[indice], newkeyp[indice], newitem, t);
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

addNumbers(listLetters1,listLetters2,listLetters3){
  const arrayFinalCrypto=[];
  const numberList=[9,7,5,3,1,8,6,4,2,0];

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
  // added numbers after letter L
  numberList.map( (item, key)=> {
    arrayFinalCrypto.splice(orderLetter + key + 1 , 0, item );
  })


  return arrayFinalCrypto;
}

encode(arrayFinalCrypto, abcInitial){
  let cripto=[];
  const objectLettersChangue={};
  const {searchtext} = this.state;
  const textoEncriptColumns = [];

  //Initializate function to changue array for each blank 
  searchtext.split(' ').map((item, key)=> {
    const cript= arrayFinalCrypto;
    let letra;
    let a;
    letra = cript[0];
   if (key>0){ //modified array when exist blank space
      let indicatorElement=0;
       while( indicatorElement < arrayFinalCrypto.length   ){

        //the letters changue 1 possition right
        if(indicatorElement === arrayFinalCrypto.length-1)
        {
       cript[0]=letra;
        }
        else{
          a = cript[indicatorElement +1];
          cript[indicatorElement +1] = letra ;
          letra = a; 
         
        }
        indicatorElement=indicatorElement+1; 

      } 
    } 
  
  //added object for abc and abc encript,
  cript.map( (item, key)=> {
  objectLettersChangue[abcInitial[key]]= item;
})

  //pusshed text encript into new array
    let n=0;
    const textoEncript = []; 
    while (n < item.length  ){
      const Text= objectLettersChangue[item[n]];
      textoEncript.push(Text);
       n=n+1
     }
     textoEncript.push(' ');
     //added text encript with blank spaces
     textoEncriptColumns.push(textoEncript.join('') )
      //changue states
     this.setState({textEncript:textoEncriptColumns.join(''),textsee:textoEncriptColumns.join(''),arrayCriptoActual:cript,activeText:true,  });
      cripto=cript;

  })
  return cripto
}


decode(){
  const arrayCriptoActual = this.encript();
  const {searchtext, Initialabc} = this.state;

  const words=[];
  searchtext.split(' ').map((item, key)=> { //separate balnk spaces into array and push into new item array
    words.push(item);
  });

  const arraylistReverse= this.invertTextSearch()
  const textotextoDecodeColumns= this.decodeTextInitialabc(arrayCriptoActual,Initialabc,arraylistReverse)
  
  
  this.setState({textsee:textotextoDecodeColumns.reverse().join('') });
}


// function to convert colums to interting text
invertTextSearch(){
  const {searchtext} = this.state;

  const array=[];

  const textReverse= Array.from(searchtext) // convert searchtext to array

  let indice=0;
  let indiceWord=0;
  let colum=[];
  textReverse.map( (item, key) => {


    if (item ===" "){
      array.push(colum.join('') )
      colum=[];
      array.push(item);
      indice=indice+1;
    }
    else {
      colum.push(item);
      if(key === textReverse.length-1  ){
        array.push(colum.join('') )
      }
    }
   });
   const arraylistReverse= array.reverse();
   return arraylistReverse;
} 

decodeTextInitialabc(arrayCriptoActual,Initialabc,arraylistReverse){
  const objectLettersInitial={};
  const textotextoDecodeColumns=[];
  arraylistReverse.join('').split(' ').map((item, key)=> {

    const cript= arrayCriptoActual;
    let letra;
    let a;
    let ultpos = arrayCriptoActual.length -1
    letra = cript[ultpos];
   if (key>0){
      let indicatorElement=0;
       //modified cript array for each blank espaces
       while( indicatorElement < arrayCriptoActual.length   ){
        if(indicatorElement === ultpos)
        {
       cript[indicatorElement]=letra;
        }
        else{
          a = cript[ultpos - indicatorElement -1];
          cript[ultpos - indicatorElement -1] = letra ;
          letra = a; 
         
        }
        indicatorElement=indicatorElement+1; 

      } 
    } 



    Initialabc.map( (item, key)=> {
  objectLettersInitial[cript[key]]= item;

}) 
    let n=0;
    const textoDecode = []; 
    while (n < item.length  ){
      const Text= objectLettersInitial[item[n]];
      textoDecode.push(Text);
       n=n+1
     }
     textoDecode.push(' ');
     textotextoDecodeColumns.push(textoDecode.join('') )
     this.setState({textInitial:textotextoDecodeColumns.join('') });
     //console.warn(textotextoDecodeColumns.join(''));

  }) 
  return textotextoDecodeColumns;
}

decreaseNumber(colum, number){
  if(colum !==3 ){
    if(number>6){
      number=number-1;
      if(colum===1){
        this.setState({number1:number, changue:true});
      }
      else{
        this.setState({number2:number, changue:true});
      }

    }


  }
}
findRestNumber(){

}
incrementNumber(colum, number){
  if(colum !==3 ){
    if(number<13){
      number=number+1;
      if(colum===1){
        this.setState({number1:number, changue:true});
      }
      else{
        this.setState({number2:number, changue:true});
      }

    }


  }
}

render() {
    // ...
 const {textsee, activeText, number1, number2, number3} = this.state;
    return (
     <ScrollView style={style.container}>
       <Image 
       style={style.Image}
       resizeMode='contain'
       source={require('./images/Encriptación.jpg')} ></Image>
       <Text style={style.tittle}>Encríptamelo</Text>
       <TextInput       placeholder="Escriba el texto aquì"
                        value={this.state.searchtext}
                        onChangeText={searchtext =>
                            this.setState({ searchtext })
                        }
                        ref={input => {
                            this.textInput = input;
                        }}
                        returnKeyType="go" />
       <View style={style.contentchangeNumber}>
       <AppButton colum={1} number={number1} onPress={()=> this.incrementNumber(1, number1)} onPress2={()=> this.decreaseNumber(1, number1)} ></AppButton>
       <AppButton colum={2} number={number2} onPress={()=> this.incrementNumber(2, number2)} onPress2={()=> this.decreaseNumber(2, number2)} ></AppButton>
       <AppButton colum={3} number={number3} onPress={()=> this.incrementNumber(3, number3)} onPress2={()=> this.decreaseNumber(3, number3)} ></AppButton>
       </View>

        <TouchableOpacity style={style.button} onPress={() => this.encript()} >
         <Text style={style.textButton} >Encriptar</Text>
       </TouchableOpacity>
       <TouchableOpacity style={style.button} onPress={() => this.decode()} >
         <Text style={style.textButton} >Desciffrar</Text>
       </TouchableOpacity>
       {
         activeText&&
        <Text selectable style={style.textencript}>{textsee}</Text>

       }



     </ScrollView>
    );
  }
}



