import { Draggable } from "react-beautiful-dnd";


function Vehicules(props) {
    let finalSpaceVehicules = props.value
    return (

        finalSpaceVehicules.map(({ id, name, thumb }, index) => {
            return (
                <Draggable key={id} draggableId={id} index={index}>
                    {(provided) => (
                        <div className="vehicule"
                        ref={provided.innerRef} 
                        {...provided.draggableProps} 
                        {...provided.dragHandleProps}
                        >
                            <li className="li-vehicule" key={id}>
                                <p>{name}</p>

                                <img src={thumb} alt={name} />
                            </li>
                        </div>
                    )}
                </Draggable>
            )
        })

    )
}

export default Vehicules