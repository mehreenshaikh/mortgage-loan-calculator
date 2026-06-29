%amortization.m - This script will help you calculate your mortgage loan.  
%   It will output a table including the payment period, payment, interest
%   paid, principal paid, and outstanding principal.
%   The inputs needed are the initial principal (term amount) to be repaid,
%   annual interest rate expressed as a decimal, the number of periodic
%   payments per year, and the total number of payment periods (years) during 
%   the life of the loan. 
%
%   Other m-files required: none
%   MAT-files required: none
%

%   Author: Mehreen Shaikh
%   email: mehreen.shaikh.642@gmail.com
%   Date: 28-Jun-2026; Last revision: 28-Jun-2026
%
%   Copyright (c) 2026, Author

% collects inputs
P0 = input("Enter the INITIAL PRINCIPAL (term amount) to be repaid: ")
annual_rate = input("Enter the ANNUAL INTEREST RATE, expressed as a decimal: ")
m = input("Enter the NUMBER OF PERIODIC PAYMENTS PER YEAR: ")
N = input("Enter the total number of PAYMENT PERIODS during the life of the loan: ")

% calculates interest rate per period and minimum periodic payment
i = annual_rate/m;
M = round((i * P0) / (1 - (1 + i)^(-N)));

% prints the above information 
fprintf('Initial Principal: $%.2f\n', P0);
fprintf('Annual Interest Rate: %.2f%%\n', annual_rate * 100);
fprintf('Interest Rate Per Period: %.4f%%\n', i * 100);
fprintf('Total Number of Payments: %d\n', N);
fprintf('Minimum Periodic Payment: $%.2f\n\n', M);

% prints header for amortization table
fprintf('Period\tPayment\t\tInterest Paid\tPrincipal Paid\tOutstanding Principal\n');

for n = 0:N
    Pn = (P0 - M/i)*(1+i)^n + M/i;

    if n == 0
        fprintf('%d\t$%.2f\t\t$%.2f\t\t$%.2f\t\t$%.2f\n', n, 0, 0, 0, Pn);
    else
        Pprev = (P0 - M/i)*(1+i)^(n-1) + M/i;
        interest_paid = i * Pprev;
        principal_paid = M - interest_paid;
        fprintf('%d\t$%.2f\t\t$%.2f\t\t$%.2f\t\t$%.2f\n', n, M, interest_paid, principal_paid, Pn);
    end
end