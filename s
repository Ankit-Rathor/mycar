

[1mFrom:[0m /home/dev5/mycar/app/controllers/addresses_controller.rb:16 AddressesController#create:

    [1;34m15[0m: [32mdef[0m [1;34mcreate[0m
 => [1;34m16[0m:
    [1;34m17[0m:   @address = [1;34;4mAddress[0m.new(address_params) 
    [1;34m18[0m:   @address.user = current_user
    [1;34m19[0m:   [32mif[0m @address.save   
    [1;34m20[0m:     flash[[33m:notice[0m] = [31m[1;31m'[0m[31maddress added![1;31m'[0m[31m[0m   
    [1;34m21[0m:     redirect_to new_car_path([35muser_id[0m: @user.id)  
    [1;34m22[0m:   [32melse[0m   
    [1;34m23[0m:     flash[[33m:error[0m] = [31m[1;31m'[0m[31mFailed to edit address![1;31m'[0m[31m[0m   
    [1;34m24[0m:     render [33m:new[0m  
    [1;34m25[0m:   [32mend[0m   
    [1;34m26[0m: [32mend[0m   

