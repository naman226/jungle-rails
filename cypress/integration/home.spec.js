describe('Home Page', () => {
  it('Visits the root page', () => {
    cy.visit('http://localhost:3000/')
    cy.screenshot('home screen')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  })

})