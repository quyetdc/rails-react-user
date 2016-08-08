# @cjsx React.DOM

@PersonCard = React.createClass
  displayName: 'PersonCard'
  render: ->
    <div>
      <h2> {@props.data.name} </h2>
      <h4> {@props.data.age} </h4>
      <img src={@props.data.image} />
    </div>