import ArtLabelTile from '../src/components/ArtLabelTile';

describe('ArtLabelTile', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <ArtLabelTile
        name="CocoPuffs"
        brewery="chocolate-y"
      />
    )
  });

  it('renders a paragraph tag with the art label name and brewery', () => {
    expect(wrapper.find('p')).toBePresent();
    expect(wrapper.find('p').text()).toMatch("CocoPuffs")
    expect(wrapper.find('p').text()).toMatch("chocolate-y")
  })

  it('renders a link with the text of the art label name and brewery', () => {
    expect(wrapper.find('Link')).toBePresent();
    expect(wrapper.find('Link').text()).toMatch("CocoPuffs")
    expect(wrapper.find('Link').text()).toMatch("chocolate-y")
  })

  it('renders a div with the text of the art label name and brewery', () => {
    expect(wrapper.find('div')).toBePresent();
    expect(wrapper.find('div').text()).toMatch("CocoPuffs")
    expect(wrapper.find('div').text()).toMatch("chocolate-y")
  })
})
