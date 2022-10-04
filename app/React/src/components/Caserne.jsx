import React from 'react'
import { Droppable, Draggable, DragDropContext } from 'react-beautiful-dnd'
import Vehicules from './Vehicules'
// import VehiculesList from './data/vehicules.js'

export default class Caserne extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            title: "Caserne"
        }
    }

    render() {
        const vehicules = this.props.value
        const handleOnDragEnd = this.props.onDragEnd
        return (
            <DragDropContext onDragEnd={handleOnDragEnd}>
                <h1>{this.state.title}</h1>

                <Droppable droppableId="vehicules">
                    {(provided) => (

                        <ul className='vehicules' {...provided.droppableProps} ref={provided.innerRef}>
                            {vehicules.map(({ id, name, thumb }, index) => console.log())}

                            <Vehicules value={vehicules} />
                            {provided.placeholder}
                        </ul>

                    )}

                </Droppable>
            </DragDropContext>

        )
    }
}