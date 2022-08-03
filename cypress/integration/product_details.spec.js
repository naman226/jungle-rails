describe('Product details', () => {
  it('Visits the root page', () => {
    cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  })

  it("Clicking on the image to select tge product", () => {
    cy.get('[alt="Giant Tea"]').click();
  })

  it("There is product details on the page", () => {
    cy.get(".product-description").should("be.visible");
  })

})