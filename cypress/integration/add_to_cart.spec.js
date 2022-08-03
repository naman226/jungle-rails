describe('Add to cart', () => {
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

  it("Click on the add to cart button and increase the cart by 1", () => {
    cy.contains("My Cart (0)");
    cy.get(".btn").first().click({force: true});
    cy.contains("My Cart (1)");
  })

})