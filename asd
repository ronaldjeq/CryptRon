/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import { Dimensions,  Text, View, TouchableOpacity, TextInput, Image,ScrollView, Picker } from 'react-native';
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
  secretWord:'',
  textEncript:'',
  textInitial:'',
  textsee:'',
  activeText:false,
  arrayCriptoActual:[],
  number1:18,
  number2:18,
  number3:18,
  changue:false,
  sustiText:'1,4,5',
  transpoText:'3,5,6',
  letterStart:'a',
  letterNumber:'f',
  aplicationType:'normal',
  orderType:'desc',
  sustiTextOr:'i,d,d',
  numberAplication:'5,2,6,3',
  activeEncode:false,
  abcalterated:[],
  numberList:[0,1,2,3,4,5,6,7,8,9],
  Initialabc: [ 'a', 'b', 'c', 'd', 'e', 'f', 'g','h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ','o','p','q' ,'r',
  's','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','Ñ','O','P','Q','R','S','T','U',
  'V','W','X','Y','Z', '0', '1','2','3','4','5','6','7','8','9']
      })
  }


componentDidMount(){
  this.setState({ 
    Textenc:'hsdasdsa',
        })
}
  
componentDidUpdate( prevState ) {
  if (  this.state.changue ===true ) {
      const numberRest= 54- this.state.number1- this.state.number2;
      this.setState({number3:numberRest,changue:false });

      // return response
  }
}
shuffleArray() {
  const {Initialabc, numberList}= this.state;
  const le =[ 'a', 'b', 'c', 'd', 'e', 'f', 'g','h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ','o','p','q' ,'r',
  's','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','Ñ','O','P','Q','R','S','T','U',
  'V','W','X','Y','Z'];
  const intitial= Initialabc;
  const numbers= numberList;
  for (let i = le.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [le[i], le[j]] = [le[j], le[i]];
  }

  for (let i = intitial.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [intitial[i], intitial[j]] = [intitial[j], intitial[i]];
}
for (let i = numbers.length - 1; i > 0; i--) {
  const j = Math.floor(Math.random() * (i + 1));
  [numbers[i], numbers[j]] = [numbers[j], numbers[i]];
}


  this.setState({abcalterated:le, Initialabc:intitial, numberList:numbers});
  return le;
}
encript(){
  const grupo1 = [];
  const grupo2 = [];
  const grupo3 = [];

const {number1, number2, number3, sustiText, transpoText, sustiTextOr,activeEncode,abcalterated}= this.state;
const letras= activeEncode?this.shuffleArray():abcalterated;
const abcInitial= this.state.Initialabc;

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
 const narray =[];
 transpoText.split(',').map(item=>{
   narray.push(item);
 })
   const listLetters1 = this.substitution(grupo1);
   console.warn('substitution',listLetters1);
   const listLetters2 =this.invert(grupo2);
   console.warn('invert',listLetters2);
   const listLetters3 = this.transp(grupo3, narray);
   console.warn('transp',listLetters3);
 const criptoArray =  this.addNumbers(listLetters1,listLetters2,listLetters3,abcInitial);
 console.warn('addNumbers',criptoArray);
 console.warn('addNumbers longitud',criptoArray.length);

 const encodeDinamic= this.encode(criptoArray, abcInitial);
 return encodeDinamic;
}

substitution(item){
  const {sustiText,sustiTextOr } =this.state;
 // const number= [3,5,2];
  const fragmentSusti= sustiText.split(',');
  const number= [];
   fragmentSusti.map(item => {
    number.push(item);  }) 
 
  const keyp = sustiTextOr.split(','); 
  let newitem=item;
  let nnumber=0;
  let nkey=0;
  const newnumber=[];
  const newkeyp=[];
  let indice=0;
  const cript= [];
  let t=indice; //podsition actual
  item.map( (letter, key) => {
    if( nkey > keyp.length-1){
      nkey=0;
    }
    if( nnumber > number.length-1){
      nnumber=0;
    }
    newnumber.push(number[nnumber]);
    newkeyp.push(keyp[nkey]);

    nnumber= nnumber+1;
    nkey= nkey+1;
  })

 


  while (indice < newnumber.length){

    if(newitem.length === 1){
      t=0;
    }
    else {
          if( newkeyp[indice]==='i'){
              if ( t - newnumber[indice] >=0){
                t =  t - newnumber[indice];
              } else {
                t =  t - newnumber[indice];
                while( t<0){
                  t = newitem.length  + t; 
                }
              }
          }
          else {
            
                if ( t + newnumber[indice]  <= newitem.length  ){
                  t =  t + newnumber[indice] -1 ;
                } else {
                  if(t + newnumber[indice] -1 === newitem.length ){
                    t = 0;
                  }
                    else {
                       t =  t + newnumber[indice]-1;
                        let count=1;
                        if(t>newitem.length){
                          while( t>newitem.length ){
                            if(indice===0){
                            }
                          t =  t- newitem.length; 
                          }
                          t=t-1;
                        }
                    }
                }
          }
          }
    cript.push(newitem[t]);
    newitem.splice(newitem.indexOf(newitem[t]), 1);
    indice=indice+1;
  }
  //return(cript);
 console.warn('sustitucion',cript);
  return(cript);
}

invert(grupo2){
  return grupo2.reverse();
}

transp(grupo3,narray){


  //const narray= [ 7,4,1,9];
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
    
    //console.warn('d',arrayLetters);
    Object.keys(arrayLetters).map((items, key) => {
    //  console.warn('¡',items);
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
  Object.keys(restarrayLetters).map((items, key) => {
    letters.push(restarrayLetters[items]);
  })
  //console.warn(grupo3);
 // console.warn(letters, 'letters');
 //console.warn(letters);
  return letters;
}

addNumbers(listLetters1,listLetters2,listLetters3){
  const {secretWord, letterStart, aplicationType, numberList,letterNumber} = this.state;
  const arrayFinalCrypto=[];

  listLetters1.map((items, key) => {
    arrayFinalCrypto.push(items);
  })
  listLetters2.map((items, key) => {
    arrayFinalCrypto.push(items);
  })
  listLetters3.map((items, key) => {
    arrayFinalCrypto.push(items);
  })

 

  //function for changue wletters with secretWord


const letterTransform = secretWord !== ''? this.newArrayLetters(arrayFinalCrypto, secretWord):arrayFinalCrypto;
const aplicationLetter = aplicationType ==='normal'? this.aplicationDouble(letterTransform):this.aplicationDoubleGradual(letterTransform);


  const orderLetter = aplicationLetter.indexOf(letterNumber);
  // added numbers after letter 
  numberList.map( (item, key)=> {
    aplicationLetter.splice(orderLetter + key + 1 , 0, item );
  })

  


  return aplicationLetter;
}
//method using double application gradual
aplicationDoubleGradual(letterTransform){

  const {orderType, numberAplication} = this.state;
  const keys = [];
  numberAplication.split(",").map((item => {
    keys.push(parseInt(item));
  }))

  const numericKey = keys;
  let newNumericKey = orderType==='desc'? [].concat(numericKey).sort((a, b) => b - a ):[].concat(numericKey).sort((a, b) => a - b ) ;
  const firstarray =  this.secondMethod([].concat(newNumericKey), letterTransform, numericKey);
  console.warn('firstarray gradual',firstarray)
  console.warn('firstarray longitud gradual',firstarray.length)

  const secondArray = this.thirdMethod([].concat(newNumericKey), firstarray, numericKey);
  console.warn('secondArray gradual',secondArray)
  console.warn('secondArray longitud gradual',secondArray.length)


  return secondArray;

}
//method using double application
aplicationDouble(letterTransform){
  const {orderType, numberAplication} = this.state;
  const keys = [];
  numberAplication.split(",").map((item => {
    keys.push(parseInt(item));
  }))

  const numericKey = keys;
  let newNumericKey = orderType==='asc'? numericKey.sort((a, b) => b - a ):numericKey.sort((a, b) => a - b ) ;

  const firstarray =  this.firstMethod([].concat(newNumericKey), letterTransform, numericKey);
  console.warn('firstarray normal',firstarray)
  console.warn('firstarray longitud normal',firstarray.length)

  const secondArray = this.firstMethod([].concat(newNumericKey), firstarray, numericKey);
  console.warn('secondArray normal',secondArray)
  console.warn('secondArray longitud normal',secondArray.length)


  return secondArray;

}

firstMethod(newNumericKey, letterTransform, numericKey){
  let indicatorNumber=0;
  const repetition= 54%newNumericKey.length >0? Math.trunc(54/newNumericKey.length )+1:Math.trunc(54/newNumericKey.length ) ;
  let t=0;
  const arraytemporal=[];
  const arraytemporal2=[];
  
  while(indicatorNumber<repetition){
    const object={};

    for( let i =0; i< numericKey.length; i++ ){
       object[newNumericKey[i]] = letterTransform[t];
       t=t+1 
    }

    arraytemporal.push(object);
    indicatorNumber=indicatorNumber+1;
  }
  
  newNumericKey.sort((a, b) => a - b ).map( (item, key) =>{
      for( let i =0; i< arraytemporal.length; i++ ) {
       arraytemporal2.push(arraytemporal[i][item]);
      }
    

    })
return arraytemporal2.filter(Boolean);
}

secondMethod(newNumericKey, letterTransform, numericKey){
  let indicatorNumber=0;
  const repetition= 54%newNumericKey.length >0? Math.trunc(54/newNumericKey.length )+1:Math.trunc(54/newNumericKey.length ) ;
  let t=0;
  const object={};
  for( let i =0; i< numericKey.length; i++ ){
    object[newNumericKey[i]] = [];
 }


  while(indicatorNumber<repetition){
    for( let i =0; i< numericKey.length; i++ ){
      if(letterTransform[t]!==undefined){
        object[newNumericKey[i]].push(letterTransform[t]);

      }
       t=t+1 
    }
    indicatorNumber=indicatorNumber+1;
  }
 
    


return object
}

thirdMethod(newNumericKey, letterTransform, numericKey){
  const object={};
  for( let i =0; i< numericKey.length; i++ ){
    object[numericKey[i]] = [];
 }
 newNumericKey.sort((a, b) => a - b );

 let i=0;
 let j=i;
let a;
    const r=0;
  while( i < numericKey.length){
    let order= numericKey.indexOf(newNumericKey[j]);

      while(order <numericKey.length ){
        let letter = letterTransform[newNumericKey[i]][r];
        if(letter!==undefined){

                         object[numericKey[order]].push(letter);
                         letterTransform[newNumericKey[i]].splice(letterTransform[newNumericKey[i]].indexOf(letter),1);
                        a=i;
               }
               else if(i+1 < numericKey.length) {
                letter=letterTransform[newNumericKey[i+1]][r];
                if(letter!==undefined){
                object[numericKey[order]].push(letter);      
                letterTransform[newNumericKey[i+1]].splice(letterTransform[newNumericKey[i+1]].indexOf(letter),1);
                a=i+1;
                }
               }

               if( letterTransform[newNumericKey[a]].length===0 && order=== numericKey.length-1){
                j=j+1;
             }
        order=order+1;
      }

        i=letterTransform[newNumericKey[i]].length===0?i+1:i;
  
  }
return Object.values(object).join().split(',')
}

// method using secret Word
newArrayLetters(arrayFinalCrypto, secretWord){

  const secretArray= [];
  let indicator=0;
  let indicatorNumber=0;
  while (indicator < secretWord.length){
    if (!secretArray.includes(secretWord[indicator])){
      secretArray.push(secretWord[indicator]);
    }

    indicator=indicator+1;
  }

  secretArray.map(item => {
    if (arrayFinalCrypto.includes(item)){
      
      arrayFinalCrypto.splice(arrayFinalCrypto.indexOf(item),1);
  }})

  const repetition= 54%secretArray.length >0? Math.trunc(54/secretArray.length )+1:Math.trunc(54/secretArray.length ) ;
  let t=0;
  const arraytemporal=[];

  while(indicatorNumber<repetition){
    let i=0;
    if(indicatorNumber===0){
     arraytemporal.push(secretArray);

    }
    else{
       FinalArray=[];

      for (i = 0; i < secretArray.length; i++) { 
          FinalArray.push(arrayFinalCrypto[t])
          t=t+1;

        }  
        arraytemporal.push(FinalArray.filter(Boolean));

      }

      indicatorNumber=indicatorNumber+1;
    }

    //arraytemporal[repetition-1].filter(Boolean);
  const newListLetters = this.orderLetter(arraytemporal);
  //console.warn('?',newListLetters);
  return newListLetters;


}
orderLetter(arraytemporal){
 // console.warn(arraytemporal);
  const arrayLetters=[];
  arraytemporal.map((items, key) => {
    //console.warn(items, key);
    arraytemporal.map((letter, indice) => {
        if(arraytemporal[indice][key]!==null){
          arrayLetters.push(arraytemporal[indice][key]);
        }
      })

  })
  return arrayLetters.filter(Boolean);

}

encode(arrayFinalCrypto, abcInitial){
  let cripto=[];
  const objectLettersChangue={};
  const {searchtext} = this.state;
  const textoEncriptColumns = [];

  //Initializate function to changue array for each blank 
  searchtext.replace(/%/g, " ").split(' ').map((item, key)=> {
    const cript= arrayFinalCrypto;
    let letra;
    let a;
    letra = cript[0];
   if (key>0){ //modified array when exist blank space
    //console.warn(cript)
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
     textoEncript.push('%');
     //added text encript with blank spaces
     textoEncriptColumns.push(textoEncript.join('') )
      //changue states
     this.setState({textEncript:textoEncriptColumns.join(''),textsee:textoEncriptColumns.join(''),arrayCriptoActual:cript,activeText:true,  });
      cripto=cript;
    //  console.warn('textEncript', textEncript );



  })

  return cripto
}


decode(){
  const arrayCriptoActual = this.encript();
  const {searchtext, Initialabc} = this.state;

  const words=[];
  searchtext.replace(/%/g, " ").split(' ').map((item, key)=> { //separate balnk spaces into array and push into new item array
    words.push(item);
  });

  const arraylistReverse= this.invertTextSearch(searchtext.replace(/%/g, " "))
  const textotextoDecodeColumns= this.decodeTextInitialabc(arrayCriptoActual,Initialabc,arraylistReverse)

  this.setState({textsee:textotextoDecodeColumns.reverse().join('') });
}


// function to convert colums to interting text
invertTextSearch(searchtext){

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
  //   console.warn(textotextoDecodeColumns.join(''));

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
    if(number<24){
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
 const {textsee, activeText, number1, number2, number3,orderType,aplicationType,activeEncode, textEncript, arrayCriptoActual } = this.state;
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
       <AppButton colum={"Letras con método de sustitución"} number={number1} onPress={()=> this.incrementNumber(1, number1)} onPress2={()=> this.decreaseNumber(1, number1)} ></AppButton>
       <AppButton colum={"Letras con método de inversión"} number={number2} onPress={()=> this.incrementNumber(2, number2)} onPress2={()=> this.decreaseNumber(2, number2)} ></AppButton>
       <AppButton colum={"Letras con método de transposición"} number={number3} onPress={()=> this.incrementNumber(3, number3)} onPress2={()=> this.decreaseNumber(3, number3)} ></AppButton>
       </View>
       <Text style={{alignSelf:'center', marginTop:30}}>Método de Sustitución</Text>
       <TextInput       placeholder="Escriba los números separados por coma, máximo 5 números "
                        value={this.state.sustiText}
                        onChangeText={sustiText =>
                            this.setState({ sustiText })
                        }
                        ref={input => {
                            this.textInput = input;
                        }}
                        returnKeyType="go" />
        <TextInput       placeholder="Escriba el ordenamiento separado por comas, ejem:: i,d,i "
                        value={this.state.sustiTextOr}
                        onChangeText={sustiTextOr =>
                            this.setState({ sustiTextOr })
                        }
                        ref={input => {
                            this.textInput = input;
                        }}
                        returnKeyType="go" />                 
       <Text style={{alignSelf:'center', marginTop:30}}>Método de transposición</Text>
       <TextInput       placeholder="Escriba los números separados por coma, máximo 5 números "
                        value={this.state.transpoText}
                        onChangeText={transpoText =>
                            this.setState({ transpoText })
                        }
                        ref={input => {
                            this.textInput = input;
                        }}
                        returnKeyType="go" />  
        <Text style={{alignSelf:'center', marginTop:30}}>Una vez aplicados los métodos escriba la letra con la que empezará el nuevo abecedario</Text>              
        <TextInput       placeholder="Escriba la letra"
                        value={this.state.letterStart}
                        onChangeText={letterStart =>
                            this.setState({ letterStart})
                        }
                        ref={input => {
                            this.textInput = input;
                        }}
                        returnKeyType="go" />                  
        <Text style={{alignSelf:'center', marginTop:30}}>Método de clave secreta</Text>              
        <TextInput       placeholder="Escriba la palabra secreta (opcional)"
                        value={this.state.secretWord}
                        onChangeText={secretWord =>
                            this.setState({ secretWord})
                        }
                        ref={input => {
                            this.textInput = input;
                        }}
                        returnKeyType="go" /> 
        <Text style={{alignSelf:'center', marginTop:30}}>Elija una opción</Text>   
        <Picker
          selectedValue={this.state.aplicationType}
          style={{ height: 50, width: 240, alignSelf:'center' }}
          onValueChange={(itemValue, itemIndex) => this.setState({aplicationType: itemValue})}>
          <Picker.Item label="Doble aplicación" value="normal" />
          <Picker.Item label="Doble aplicación gradual" value="gradual" />
        </Picker>
        <View style={{flexDirection: 'row'}}>
            <TextInput       placeholder="Escriba los números "
                          value={this.state.numberAplication}
                          onChangeText={numberAplication =>
                              this.setState({ numberAplication})
                          }
                          ref={input => {
                              this.textInput = input;
                          }}
                          returnKeyType="go"
                          style={{width:140}} />      
            <Picker
            selectedValue={this.state.orderType}
            style={{ marginLeft:30,height: 50, width: 160, alignSelf:'center' }}
            onValueChange={(itemValue, itemIndex) => this.setState({orderType: itemValue})}>
            <Picker.Item label="descendente" value="desc" />
            <Picker.Item label="ascendente" value="asc" />
          </Picker>               
        </View>
        <TextInput       placeholder="¿Apartir de qué letra se agregarán los números? "
                        value={this.state.letterNumber}
                        onChangeText={letterNumber =>
                            this.setState({ letterNumber})
                        }
                        ref={input => {
                            this.textInput = input;
                        }}
                        returnKeyType="go" />                           
        <TouchableOpacity style={style.button} onPress={() => 
          this.setState({
            activeEncode: true
        }, () => {
          this.encript();
        })
        } >
         <Text style={style.textButton} >Encriptar</Text>
       </TouchableOpacity>
       <TouchableOpacity style={style.button} onPress={() =>
        
        this.setState({
          activeEncode: false
      }, () => {
        this.decode();
      })
      } >
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



