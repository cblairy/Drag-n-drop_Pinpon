import './App.css'
import Caserne from './components/Caserne'
import ListeSinistres from './components/ListeSinistres'
import { DragDropContext } from 'react-beautiful-dnd'
import React, { useState } from 'react'
import citerne from './images/citerne.png'
import camionnette from './images/camionnette.png'
import vehicule from './images/vehicule-leger.png'



const finalSpaceVehicules = [
  {
    id: 'citerne1',
    name: 'Camion Citerne',
    thumb: citerne
  },
  {
    id: 'citerne2',
    name: 'Camion Citerne',
    thumb: citerne
  },
  {
    id: 'citerne3',
    name: 'Camion Citerne',
    thumb: citerne
  },
  {
    id: 'citerne4',
    name: 'Camion Citerne',
    thumb: citerne
  },
  {
    id: 'camion-lance1',
    name: 'Camion lance',
    thumb: citerne
  },
  {
    id: 'camion-lance2',
    name: 'Camion lance',
    thumb: citerne
  },
  {
    id: 'camionnette1',
    name: 'Camionnette d\'urgence',
    thumb: camionnette
  },
  {
    id: 'camionnette2',
    name: 'Camionnette d\'urgence',
    thumb: camionnette
  },
  {
    id: 'camionnette3',
    name: 'Camionnette d\'urgence',
    thumb: camionnette
  },
  {
    id: 'vehicule1',
    name: 'Véhicule leger',
    thumb: vehicule
  },
  {
    id: 'vehicule2',
    name: 'Véhicule leger',
    thumb: vehicule
  },
  {
    id: 'vehicule3',
    name: 'Véhicule leger',
    thumb: vehicule
  },
  {
    id: 'vehicule4',
    name: 'Véhicule leger',
    thumb: vehicule
  },
]




const App = (props) => {
  const [vehicules, setVehicules] = useState(finalSpaceVehicules);
  // on passe a setVehicules sa nouvelle valeur (change le state)
  
  const handleOnDragEnd = (result) => { return console.log("coco")
    // const item = Array.from(vehicules)
    
    // const Item = item.splice(result.source.index, 1)
   
    // console.log(reoderedItem)
  }

  return (

    <DragDropContext>

      <header className="App-drag">
        <Caserne value={vehicules} onDragEnd={handleOnDragEnd} />
        <img src='../images/citerne.png'></img>
      </header>
      <div className='App-drag'>
        <ListeSinistres onDragEnd={handleOnDragEnd} />
        <ListeSinistres onDragEnd={handleOnDragEnd} />
      </div>
    </DragDropContext>

  );
}

export default App


