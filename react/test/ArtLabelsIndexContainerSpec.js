import ArtLabelsIndexContainer from '../src/containers/ArtLabelsIndexContainer';
import ArtLabelTile from '../src/components/ArtLabelTile';

describe('ArtLabelsIndexContainer', () => {
  let wrapper;

  beforeEach(() => {
    let response = new window.Response(
      JSON.stringify({
        "art_labels": [
        {
          "id": 1,
          "name": "CocoPuffs",
          "brewery": "chocolate-y",
          "image_url": "image.png"
        }
      ]}
      ), {
        status: 200,
        statusText: 'OK',
        headers: { 'Content-Type': 'application/json' }
      }
    )
    spyOn(global, 'fetch').and.returnValue(Promise.resolve(response))
    wrapper = mount(
      <ArtLabelsIndexContainer
      />
    )
  });

  it('should render an ArtLabelTile component', done => {
    setTimeout(() => {
      expect(wrapper.find(ArtLabelTile)).toBePresent();
      done();
    }, 0);
  });

  it('should have the specified intial state', () => {
    expect(wrapper.state()).toEqual({
      art_labels: []
    })
  })

  it('should have a new state after fetch', done => {
    setTimeout(() => {
      expect(wrapper.state()).toEqual({
        art_labels: [
          {
            "id": 1,
            "name": "CocoPuffs",
            "brewery": "chocolate-y",
            "image_url": "image.png"
          }
        ]
      })
      done();
    }, 0)
  })

  it('should render an ArtLabelTile Component with specific props', done => {
    setTimeout(() => {
      expect(wrapper.find(ArtLabelTile).at(0).props()).toEqual({
        "id": 1,
        "name": "CocoPuffs",
        "brewery": "chocolate-y"
      })
      done();
    }, 0)
  })
})
