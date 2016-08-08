# @cjsx React.DOM
# We need above comment to tell Rails we are using JSX
# so it can compile the file to Javascript

@PeopleSection = React.createClass
  displayName: 'PeopleSection'

  # Provide initial state for the render method
  getInitialState: ->
    didFetchData: false
    people: []

  # invoked right after the component renders
  componentDidMount: ->
    @_fetchPeople({})

  _fetchPeople: (data) ->
    # fetch successful from API
    @setState
      didFetchData: true
      people: [{id: 1, name: 'Colin', age: '25', image: 'http://nick.mtvnimages.com/nick/video/images/avatar/avatar-117-16x9.jpg'}]

  # This defines how the component is going to be rendered
  render: ->
    cardsNode = @state.people.map (person) ->
      <PersonCard key={person.id} data={person}/>

    <div> {cardsNode} </div>