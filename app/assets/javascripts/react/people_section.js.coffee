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
    $.ajax
      url: '/users'
      dataType: 'json'
      data: data
    .done @_fetchDataDone
    .fail @_fetchDataFail

  _fetchDataDone: (data, textStatus, jqXHR) ->
    # fetch successful from API
    @setState
      didFetchData: true
      people: data['users']
  _fetchDataFail: (xhr, status, err) ->
    console.error @props.url, status, err.toString()

  # Handler for search submit event
  _handleOnSearchSubmit: (search) ->
    @_fetchPeople
      search: search

  # This defines how the component is going to be rendered
  render: ->
    cardsNode = @state.people.map (person) ->
      <PersonCard key={person.id} data={person}/>


    noDataNode =
      <div>
        <p className="text-danger"> No people found </p>
      </div>

    <div className="row">
      <PeopleSearch onFormSubmit={@_handleOnSearchSubmit} />

      {
        if @state.people.length > 0
          cardsNode
        else if @state.didFetchData
          noDataNode
      }
    </div>