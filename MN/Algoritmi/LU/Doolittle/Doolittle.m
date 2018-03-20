## Copyright (C) 2018 Pepi
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} LU_Doolittle (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Pepi <pepi@pepi-VirtualBox>
## Created: 2018-03-20

function [L U] = Doolittle(A)
  [m, n]  = size(A);
  if m ~= n 
    disp('Matrix must be square')
    break 
  end
  U=zeros(m);
  L=zeros(m);
  for j=1:m
    L(j,j)=1;
  end
  for j=1:m
    U(1,j)=A(1,j);
  end
  for i = 2 : m
    for j = 1 : m
      for k = 1 : i - 1
        s1 = 0;
        if k == 1
          s1 = 0;
            else
              for p = 1 : k - 1
                  s1 = s1 + L(i, p) * U(p, k);
              end
            end
            L(i, k) = (A(i, k) - s1) / U(k, k);
        end
        for k = i : m
          s2 = 0;
          for p = 1 : i - 1
            s2 = s2 + L(i, p) * U(p, k);
          end
          U(i, k) = A(i, k) - s2;
        end
    end
  end
disp('The matrix is')
A
disp('The Lower Triangular Matrix is')
L
disp('The Upper Triangular Matrix is')
U
endfunction
