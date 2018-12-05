import React, { Component } from 'react';
import {Dimensions, View, Text, TouchableOpacity} from 'react-native';
const DEVICE_WIDTH = Dimensions.get( "window" ).width;

const style = {
    container:{
        justifyContent:'center',
        alignItems: "center",
        width: DEVICE_WIDTH/3,
    },

    containerNumber:{
        marginTop:10,
        flexDirection:'row',
        justifyContent:'center',
        alignItems: "center",
        height:30,
    },

    containerButtons:{
        justifyContent:'center',
        alignItems: "center",
        backgroundColor:'#00FF7F',
        height:'100%',
    },
    Button:{
        height:'50%',
        alignItems: "center",
    }

}

export  default class AppButton extends Component {
    render(){
         const {colum, number, onPress, onPress2} = this.props;
        // const {width} = Dimensions.get('window');
        return (
            <View style={style.container}>
                <Text style={{textAlign:'center'}}> {colum} </Text>
                <View style={style.containerNumber}>
                    <Text>{number}</Text>
                    <View style={style.containerButtons}>
                        <TouchableOpacity style={style.Button} onPress={onPress} >
                            <Text>+</Text>  
                        </TouchableOpacity>
                        <TouchableOpacity style={style.Button} onPress={onPress2}>
                            <Text>-</Text>  
                        </TouchableOpacity>
                    </View>
                </View>

            </View>
        );
    }
}