import ReviewShow from '../src/components/ReviewShow';

describe('ReviewShow', () => {
  let wrapper;
  let data =
  {
    id: 1,
    feels: "His blood smells like cologne",
    intoxication_level: "Drunk",
    joy: 4,
    fear: 5,
    sadness: 3,
    disgust: 2,
    anger: 3,
    cleverness: 4,
    collectability: 3,
    controversiality: 1,
    buyability: 4
  }

  beforeEach(() => {
    wrapper = mount(
      <ReviewShow
        review = {data}
        username = "francis"
      />
    )
  });

  it('renders a paragraph tag with the review username', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("francis")
  })

  it('renders a paragraph tag with the review feels', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Feels: His blood smells like cologne")
  })

  it('renders a paragraph tag with the review intoxication_level', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Intoxication Level: Drunk")
  })

  it('renders a paragraph tag with the review joy level', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Joy: 4")
  })

  it('renders a paragraph tag with the review fear level', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Fear: 5")
  })

  it('renders a paragraph tag with the review sadness level', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Sadness: 3")
  })

  it('renders a paragraph tag with the review disgust level', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Disgust: 2")
  })

  it('renders a paragraph tag with the review anger level', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Anger: 3")
  })

  it('renders a paragraph tag with the review cleverness level', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Cleverness: 4")
  })

  it('renders a paragraph tag with the review collectability level', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Collectability: 3")
  })

  it('renders a paragraph tag with the review controversiality level', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Controversiality: 1")
  })

  it('renders a paragraph tag with the review Buyability level', () => {
    expect(wrapper.find('p')).toBePresent()
    expect(wrapper.find('p').text()).toMatch("Buyability: 4")
  })
})
