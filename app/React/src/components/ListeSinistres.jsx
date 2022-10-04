import React from 'react'
import { Droppable, DragDropContext } from 'react-beautiful-dnd'
import Sinitres from './Sinistres'

export default class ListeSinistres extends React.Component {

    constructor(props) {
        super(props)
        this.handleOnDragEnd = this.props.onDragEnd
        this.state = {
            title: "Sinistre "
        }
    }

    render() {

        return (
            <DragDropContext onDragEnd={console.log('coucou')}>
                <div className='listeSinistre'>
                    <h1>{this.state.title}</h1>


                    <Droppable droppableId="sinistres" >
                        {(provided) => (


                            <ul {...provided.droppableProps} ref={provided.innerRef} >
                                <Sinitres />

                                {provided.placeholder}
                            </ul>


                        )}
                    </Droppable>


                </div>
            </DragDropContext >
        )
    }
}