//
//  Preguntas.swift
//  PersonalityQuiz
//
//  Created by Дмитрий Имаев on 25.12.2022.
//

import Foundation

struct Preguntas {
    var text: String
    var tipo: ResponseType
    var answers: [Answer]
    
    
    enum ResponseType {
        case single, multiply, ranged
    }
    
}
    struct Answer {
        var text: String
        var tipo: PerroType
        
        
        enum PerroType: String {
            case azul = "Chase", rojo = "Marshall", amarillo = "Rubble", verde = "Rocky", rosa = "Skye", naranja = "Zuma"
            
            var defenition: String {
                switch self {
                case .azul:
                    return "Es un cachorro de 7 años y de raza pastor alemán. Es un perrito policía, espía, por lo que sus deberes se enfocan en proteger a los ciudadanos, controlar el tránsito y buscar objetos perdidos. Junto a Skye es uno de los cachorros más convocados a las misiones. Es el más maduro y serio en las misiones, siendo el líder en la mayoría de ellas, pero también tiene un aspecto juguetón cuando no hay misiones. Su olfato está muy desarrollado y le tiene miedo a los dentistas y es alérgico a los gatos."
                case .rojo:
                    return "Es un cachorro de 6 años y de raza dálmata. Desempeña el papel de bombero, así como de cachorro médico, por lo que sus deberes se enfocan en sanar heridos, apagar incendios, rescatar a personas de sitios elevados y controlar el estado de salud de cualquier persona. Es muy divertido con frecuencia, pero lo que resalta de él es su torpeza, que casi nunca es un impedimento para realizar su labor. Tiene miedo a volar. También es muy amable, especialmente con las aves."
                case .amarillo:
                    return "Es un cachorro de 5 años bulldog inglés. Se dedica a la construcción, por lo que sus deberes se enfocan en construir estructuras, demolerlas y usar muchos tipos de maquinarias. Es el último miembro en entrar a la patrulla (antes de Everest). Le tiene miedo a las arañas, a los fantasmas y a la oscuridad. Es bastante juguetón, glotón y le encanta reír. También tiene mucha imaginación y creatividad, lo que le permite más eficacia."
                case .naranja:
                    return "Es un cachorro labrador de 5 años especializado en rescate acuáticos; por lo que sus deberes se enfocan en navegar el océano con su aerodeslizador o superficies acuosas como lagos. Zuma también se dedica al buceo por lo que puede investigar bajo el agua y usar herramientas de rastreo (como sonares). Le encanta reír y el surf, aunque se le ve tranquilo y relajado. Él y Rocky son buenos amigos a pesar de que Rocky le tenga miedo al agua. Él y Skye son muy competitivos."
                case .verde:
                    return "Es un cachorro mestizo de 6 años (posiblemente mezcla de schnauzer con terrier escocés o de border collie con pastor australiano), especializado en reciclaje, por lo que sus deberes se enfocan en recoger las cosas para volverlas a utilizar y reciclarlas; también posee un kit de herramientas para poder arreglar ciertas cosas. Su vehículo posee gran cantidad de materiales útiles para las misiones. Le tiene un gran miedo al agua y trata de alejarse de lugares húmedos, aunque Marshall siempre lo está mojando. También es muy juguetón, al igual que los demás cachorros. "
                case .rosa:
                    return "Es una cocker spaniel, el primer personaje femenino de los cachorros hasta la llegada de Everest. Tiene 5 años. Ama volar y posee un helicóptero; por lo que sus deberes se enfocan en sobrevolar el aire, además su vehículo tiene un gancho que le permite agarrar cosas. Junto con Chase, es una de los cachorros más convocados a las misiones. Suele manifestar su alegría dando una volteretas. Le tiene miedo a las águilas. Su mejor amiga es Everest. Entre ella y Zuma tienen cierta competitividad."
                }
            }
        }
    }





