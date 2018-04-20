const CryptoLoveLetter = artifacts.require("./CryptoLoveLetter.sol")

contract('CryptoLoveLetter', (accounts) => {

  let clLetter

  before(async () => {
    clLetter = await CryptoLoveLetter.deployed()
  })

  it('should set owner to msg.sender', async () => {
    let owner = await clLetter.contractOwner()
    assert(owner === accounts[0])
  })

  it('should create new page', async () => {
    let txt = 'root1root2root3root4root5root6root7root8root9root1root2root3root4root5root6root7root8root9'
    let length = await clLetter.getPageLength()
    assert.equal(length, 0)
    await clLetter.newPage(txt,
      { from: accounts[1] }
    )
    length = await clLetter.getPageLength()
    assert.equal(length, 1)

    let twitterId = await clLetter.getPageTwitterId(0)
    assert.equal(twitterId, txt)
  })

})

contract('CryptoLoveLetter', (accounts) => {

  let clLetter

  before(async () => {
    clLetter = await CryptoLoveLetter.deployed()
    await clLetter.newPage('root',
      { from: accounts[1] }
    )
  })

  it('should buy', async () => {
    await clLetter.buy(
      0,
      0,
      1,
      1,
      0,
      0,
      'nick',
      'content',
      'link',
      { from: accounts[1] }
    )
  })

})
