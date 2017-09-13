import ArtLabelShowContainer from '../src/containers/ArtLabelShowContainer';
import ArtLabelShow from '../src/components/ArtLabelShow';

describe('ArtLabelShowContainer', () => {
  let wrapper;

  beforeEach(() => {
    let response = new window.Response(
      JSON.stringify({
        "art_label":
        {
          "id": 1,
          "name": "CocoPuffs",
          "brewery": "chocolate-y",
          "label_photo": "image.png",
          "reviews": [
            {
              "id": 5,
              "feels": "His blood smells like cologne",
              "intoxication_level": "[\"Drunk\"]",
              "joy": 4,
              "fear": 5,
              "sadness": null,
              "disgust": null,
              "anger": 3,
              "cleverness": null,
              "collectability": null,
              "controversiality": null,
              "buyability": null
            }
          ]
        }
      }
      ), {
        status: 200,
        statusText: 'OK',
        headers: { 'Content-Type': 'application/json' }
      }
    )
    spyOn(global, 'fetch').and.returnValue(Promise.resolve(response))
    wrapper = mount(
      <ArtLabelShowContainer
        params={1}
      />
    )
  });

  it('should render a ArtLabelShow component', done => {
    setTimeout(() => {
      expect(wrapper.find(ArtLabelShow)).toBePresent();
      done();
    }, 0);
  });

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({
      art_label: {
        label_photo: {
          url: ""
        },
        user: {
          username: ""
        }
      },
      reviews: []
    })
  });

  it('should have a new state after fetch', done => {
    setTimeout(() => {
      expect(wrapper.state()).toEqual({
        art_label: {
          id: 1,
          name: "CocoPuffs",
          brewery: "chocolate-y",
          label_photo: "image.png",
          reviews: [
            {
              id: 5,
              feels: "His blood smells like cologne",
              intoxication_level: "[\"Drunk\"]",
              joy: 4,
              fear: 5,
              sadness: null,
              disgust: null,
              anger: 3,
              cleverness: null,
              collectability: null,
              controversiality: null,
              buyability: null
            }
          ]
        },
        reviews: [
          {
            id: 5,
            feels: "His blood smells like cologne",
            intoxication_level: "[\"Drunk\"]",
            joy: 4,
            fear: 5,
            sadness: null,
            disgust: null,
            anger: 3,
            cleverness: null,
            collectability: null,
            controversiality: null,
            buyability: null
          }
        ]
      })
      done();
    }, 0)
  });
})
