const CryptoLoveLetter = artifacts.require("./CryptoLoveLetter.sol")

contract('CryptoLoveLetter', (accounts) => {

  let clLetter

  before(async () => {
    clLetter = await CryptoLoveLetter.deployed()
  })

  it('should set manager to msg.sender', async () => {
    let manager = await clLetter.manager()
    assert(manager === accounts[0])
  })

  it('should create new page', async () => {
    let txt = 'root1root2root3root4root5root6root7root8root9root1root2root3root4root5root6root7root8root9'
    let length = await clLetter.getPagesLength()
    assert.equal(length, 0)
    await clLetter.newPage(txt,
      { from: accounts[1] }
    )
    length = await clLetter.getPagesLength()
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

  it('should write a letter', async () => {
    let _val = web3.toWei(0.01, 'ether')
    await clLetter.writeLetter(
      0,
      'content',
      { from: accounts[1], value: _val }
    )
  })

})
