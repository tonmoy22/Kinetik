// automation work for the given site.

describe('Automated Scenario', () => {
  it('should complete the scenario', () => {
    // Launch browser and navigate to the URL
    cy.visit('http://automationexercise.com');

    // Verify home page
    cy.contains('Home Page Text').should('be.visible');

    // Add products to cart
    cy.get('.add-to-cart-button').click(); // Replace with the actual add to cart button selector

    // Click Cart button
    cy.get('.cart-button').click();

    // Verify cart page
    cy.contains('Cart Page Text').should('be.visible');

    // Click Proceed To Checkout
    cy.get('.proceed-to-checkout-button').click();

    // Click Register / Login button
    cy.get('.register-login-button').click();

    // Fill in sign up details
    cy.get('#username').type('your_username');
    cy.get('#email').type('your_email@example.com');
    cy.get('#password').type('your_password');
    // ... fill in other sign up details ...

    // Click Register button
    cy.get('.register-button').click();

    // Verify 'ACCOUNT CREATED!'
    cy.contains('ACCOUNT CREATED!').should('be.visible');

    // Click Continue button
    cy.get('.continue-button').click();

    // Verify 'Logged in as username'
    cy.contains('Logged in as your_username').should('be.visible');

    // Click Cart button again
    cy.get('.cart-button').click();

    // Click Proceed To Checkout button again
    cy.get('.proceed-to-checkout-button').click();

    // Verify Address Details and Review Your Order
    cy.contains('Address Details').should('be.visible');
    cy.contains('Review Your Order').should('be.visible');

    // Enter description in comment text area
    cy.get('.comment-textarea').type('This is a test comment');

    // Click Place Order
    cy.get('.place-order-button').click();

    // Enter payment details
    cy.get('#name-on-card').type('Your Name');
    cy.get('#card-number').type('1234567890123456');
    cy.get('#cvc').type('123');
    cy.get('#expiration-date').type('12/23');

    // Click Pay and Confirm Order button
    cy.get('.pay-confirm-button').click();

    // Verify success message
    cy.contains('Your order has been placed successfully!').should('be.visible');
  });
});
