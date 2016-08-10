# @cjsx React.DOM
# We need above comment to tell Rails we are using JSX
# so it can compile the file to Javascript

@PeopleSection = React.createClass
  displayName: 'PeopleSection'

  # Provide initial state for the render method
  getInitialState: ->
    didFetchData: false
    people: []
    meta:
      total_pages: 0
      current_page: 1
      total_count: 0
    fetchData:
      search: ''
      page: 1

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
    return false unless @isMounted()
    # fetch successful from API
    @setState
      didFetchData: true
      people: data['users']
      meta: data.meta

  _fetchDataFail: (xhr, status, err) ->
    console.error @props.url, status, err.toString()

  # Handler for search submit event
  _handleOnSearchSubmit: (search) ->
    @state.fetchData.search = search
    @_fetchPeople
      search: search

  #  __handleOnSearchChanged: (search) ->
  #    @_fetchPeople
  #      search: search

  _handleOnPaginate: (pageNumber) ->
    @state.fetchData.page = pageNumber
    @_fetchPeople @state.fetchData

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

      <div className="container">
        <PaginatorSection totalPages={@state.meta.total_pages} currentPage={@state.meta.current_page} onPaginate={@_handleOnPaginate} />
      </div>

      {
        if @state.people.length > 0
          cardsNode
        else if @state.didFetchData
          noDataNode
      }
    </div>