import ArtLabelShow from '../src/components/ArtLabelShow';

describe('ArtLabelShow', () => {
  let wrapper;
  let data = {
    id: 1,
    name: "CocoPuffs",
    brewery: "chocolate-y",
    beer_style: "warm",
    art_style: "fuzzies",
    container_type: "growler",
    beer_description: "yayyyyyyy",
    art_description: "double yayyyyyyyy",
    beer_rating: 5,
    user: {
      username: "barthbart"
    }
  }

  beforeEach(() => {
    wrapper = mount(
      <ArtLabelShow
        art_label = {data}
      />
    )
  });

  it('renders an h2 tag with the art label name', () => {
    expect(wrapper.find('h2')).toBePresent()
    expect(wrapper.find('h2').text()).toBe("CocoPuffs")
  })

  it('renders a paragraph tag with the art label brewery', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("chocolate-y")
  })

  it('renders a paragraph tag with the art label beer style', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("warm")
  })

  it('renders a paragraph tag with the art label art style', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("fuzzies")
  })

  it('renders a paragraph tag with the art label container type', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("growler")
  })

  it('renders a paragraph tag with the art label beer description', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("yayyyyyyy")
  })

  it('renders a paragraph tag with the art label art description', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("double yayyyyyyyy")
  })

  it('renders a paragraph tag with the art label beer rating', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("5")
  })

  it('renders a paragraph tag with the art label username', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("barthbart")
  })

  it('renders a div tag with the art label brewery, beer style, art style, container type, beer description, art description, beer rating', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("chocolate-y")
    expect(wrapper.find('p').text()).toMatch("warm")
    expect(wrapper.find('p').text()).toMatch("fuzzies")
    expect(wrapper.find('p').text()).toMatch("growler")
    expect(wrapper.find('p').text()).toMatch("yayyyyyyy")
    expect(wrapper.find('p').text()).toMatch("double yayyyyyyyy")
    expect(wrapper.find('p').text()).toMatch("5")
    expect(wrapper.find('p').text()).toMatch("barthbart")
  })
})
