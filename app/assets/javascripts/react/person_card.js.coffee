# @cjsx React.DOM
@PersonCard = React.createClass
  displayName: 'PersonCard'
  render: ->
    # We use this add-on to set main div's classname
    # It will apply every key of which value is true
    # To the className attribute
#    cx = React.addons.classSet
#    cardClasses = cx(
#      'card': true
#      'thumbnail': true
#      'female': @props.data.gender == 'female'
#      'male': @props.data.gender == 'male')

    cardClasses = "card thumbnail male"
    
    <div className="col-sm-6 col-md-4">
      <div className={cardClasses}>
        <img src={@props.data.image} />
        <div className="caption">
          <h3>{@props.data.name}</h3>
          <p>{@props.data.age}</p>
          <p>
            <a href="#" className="btn btn-primary" role="button">Button</a>
            <a href="#" className="btn btn-default" role="button">Button</a>
          </p>
        </div>
      </div>
    </div>
