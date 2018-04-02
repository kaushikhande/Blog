require 'test'
def create_bank_list(bank_details)
  bank_details.each do |details|
    #bank_det = Bank.where({
    #  :name      => details[:name],
    #  :shortname => details[:shortName],
    #  :external_id => details[:id],
    #  :type => details[:type]
    #}).first_or_initialize
    bank_detail = Bank.where(:name => details['name']).first_or_initialize
    bank_detail.external_id = details['id']
    bank_detail.shortname = details['shortName']
    
    bank_detail.instituteType = details['instituteType']
    bank_detail.country = details['country']
    bank_detail.serviceName = details['serviceName']
    bank_detail.serviceType = details['serviceType']
    bank_detail.loginIdCaption = details['loginIdCaption']
    bank_detail.passwordCaption = details['passwordCaption']
    bank_detail.securityCodeCaption = details['securityCodeCaption']


    bank_detail.save
  end
end

a = AccessApi.new
token = a.getToken
ins = a.getInstituteList(token)
a = JSON.parse(ins.body).to_h
a = a['data']

create_bank_list(a)
=begin

rake db:seed


rails generate migration AddColumnsToBanks instituteType:string country:string serviceName:string loginIdCaption:string passwordCaption:string serviceType:string securityCodeCaption:string


create_bank_list([
    {:id=>"AU00000", :name=>"Basiq Test Bank"},
    {:id=>"AU00001", :name=>"Hooli Bank"},
    {:id=>"AU00101", :name=>"Bendigo and Adelaide Bank Limited"},
    {:id=>"AU00201", :name=>"ING Bank (Australia) Limited (trading as ING Direct)"},
    {:id=>"AU00301", :name=>"Macquarie Bank Limited"},
    {:id=>"AU00401", :name=>"Bankwest Bank (a subsidiary of Commonwealth Bank)"},
    {:id=>"AU00501", :name=>"AMP Bank Ltd"},
    {:id=>"AU00601", :name=>"Australia and New Zealand Banking Group Limited*"},
    {:id=>"AU00701", :name=>"Bank of Queensland Limited"},
    {:id=>"AU00901", :name=>"Credit Union Australia Ltd"},
    {:id=>"AU01001", :name=>"National Australia Bank Limited*"},
    {:id=>"AU01101", :name=>"Suncorp-Metway Limited"},
    {:id=>"AU01201", :name=>"American Express"},
    {:id=>"AU02201", :name=>"Arab Bank Australia Limited"},
    {:id=>"AU02501", :name=>"Australian Military Bank Ltd"},
    {:id=>"AU03001", :name=>"Bank of Melbourne (a subsidiary of Westpac)"}, 
    {:id=>"AU03101", :name=>"Bank of Sydney Ltd"}, 
    {:id=>"AU03201", :name=>"BankSA (a subsidiary of Westpac)"}, 
    {:id=>"AU04301", :name=>"Commonwealth Bank of Australia*"}, 
    {:id=>"AU04501", :name=>"Community CPS Australia Limited (trading as Beyond Bank Australia)"}, 
    {:id=>"AU04601", :name=>"Community First Credit Union Limited"}, 
    {:id=>"AU05201", :name=>"Defence Bank Limited"}, 
    {:id=>"AU05401", :name=>"ECU Australia Limited"}, 
    {:id=>"AU06401", :name=>"Gateway Credit Union Ltd"}, 
    {:id=>"AU06701", :name=>"Greater Bank Limited"}, 
    {:id=>"AU06801", :name=>"Heritage Bank Limited"}, 
    {:id=>"AU07201", :name=>"HSBC Bank Australia Limited"}, 
    {:id=>"AU07301", :name=>"Hume Bank Limited"}, 
    {:id=>"AU07601", :name=>"IMB Ltd (trading as IMB Bank)"}, 
    {:id=>"AU08801", :name=>"mecu Limited (trading as Bank Australia)"}, 
    {:id=>"AU08901", :name=>"Members Equity Bank Limited (trading as ME Bank)"}, 
    {:id=>"AU09801", :name=>"People's Choice Credit Union"}, 
    {:id=>"AU09901", :name=>"Police & Nurses Limited (trading as P&N Bank)"}, 
    {:id=>"AU10501", :name=>"RACQ Bank"}, 
    {:id=>"AU10701", :name=>"Qudos Mutual Ltd (trading as Qudos Bank)"}, 
    {:id=>"AU11201", :name=>"Railways Credit Union Limited (trading as myMOVE)"}, 
    {:id=>"AU11301", :name=>"RAMS (a subsidiary of Westpac)"}, 
    {:id=>"AU11901", :name=>"SGE Mutual Limited"}, 
    {:id=>"AU12301", :name=>"St. George Bank (a subsidiary of Westpac)"}, 
    {:id=>"AU12601", :name=>"Sydney Credit Union Ltd"}, 
    {:id=>"AU12701", :name=>"Teachers Mutual Bank Limited"}, 
    {:id=>"AU13601", :name=>"UBank (a subsidiary of NAB)"}, 
    {:id=>"AU14201", :name=>"Westpac Banking Corporation"}, 
    {:id=>"NZ00101", :name=>"Australia and New Zealand Banking Group Limited"},
    {:id=>"NZ00201", :name=>"Bank of New Zealand"}, 
    {:id=>"NZ00301", :name=>"ASB Bank"}
])
=end
