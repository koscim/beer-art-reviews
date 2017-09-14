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
          "label_photo": "image.png"
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
            "label_photo": "image.png"
          }
        ]
      })
      done();
    }, 0)
  })

  it('should have a new state after fetch when search function is implemented', done => {
    global.window = { location : { host: 'http://localhost:3000/art_labels?utf8=%E2%9C%93&term=coco' } }
    // window.location.href = 'http://localhost:3000/art_labels?utf8=%E2%9C%93&term=coco'
    setTimeout(() => {
      expect(wrapper.state()).toEqual({
        art_labels: [
          {
            "id": 1,
            "name": "CocoPuffs",
            "brewery": "chocolate-y",
            "label_photo": "image.png"
          }
        ]
      })
      done();
    }, 0)
  })

  it('should have no state after fetch when searching for nonexistant art label', done => {
    global.window = { location : { host: 'http://localhost:3000/art_labels?utf8=%E2%9C%93&term=lolol' } }
    // window.location.href = 'http://localhost:3000/art_labels?utf8=%E2%9C%93&term=coco'
    setTimeout(() => {
      expect(wrapper.state()).toEqual({
        art_labels: []
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


describe('ArtLabelsIndexContainer with search', () => {
  let wrapper;

  beforeEach(() => {
    Object.defineProperty(window.location, 'href', {
      value: 'http://localhost:3000/art_labels?utf8=%E2%9C%93&term=coco'
    });

    let response = new window.Response(
      JSON.stringify({
        "art_labels": [
        {
          "id": 1,
          "name": "CocoPuffs",
          "brewery": "chocolate-y",
          "label_photo": "image.png"
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

  it('should have a new state after fetch when search function is implemented', done => {
    setTimeout(() => {
      expect(wrapper.state()).toEqual({
        art_labels: [
          {
            "id": 1,
            "name": "CocoPuffs",
            "brewery": "chocolate-y",
            "label_photo": "image.png"
          }
        ]
      })
      done();
    }, 0)
  })

  it('should have no state after fetch when searching for nonexistant art label', done => {
    setTimeout(() => {
      expect(wrapper.state()).toEqual({
        art_labels: []
      })
      done();
    }, 0)
  })
})
