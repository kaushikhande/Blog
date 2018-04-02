
require 'httparty'
require 'test'


class AccessApi
  include HTTParty
  base_uri "au-api.basiq.io"
  def getToken
    headers = {
      "Authorization"  => "Basic ZDE4MDFiNGUtNDVkZi00ZTZkLWI4NDMtY2NmYzZlNDc1MjI4OmZjNWRlMmVmLTI4NjctNGExYi04YTJkLTU1M2NiYTMxMTk4Yg==",
      "Content-Type"   => "application/x-www-form-urlencoded"
    }
    res = HTTParty.post("https://au-api.basiq.io/oauth2/token",
            :headers => headers,
            body: {:grant_type => 'client_credentials'})
   
    if res.success?
      @token = res['access_token']
    else 
      @token = nil
    end

  end

  def getInstituteList(token)

    auth =  "Bearer " + token.to_s

    headers = {
      "Authorization"  => auth

    }
    @institutes = self.class.get("/institutions",
            :headers => headers)

  end

  def getAccount(token, login, passkey, bankid)

    auth =  "Bearer " + token.to_s

    headers = {
      "Authorization"  => auth,
       "Content-Type" => "application/json"

    }
    @account_details = self.class.post("/connections",
            :headers => headers, body: {:loginId => login.to_s, :password => passkey.to_s,
:externalUserId => '01', :institution => {:id =>bankid.to_s}}.to_json)


  end

  def getTransactions(token, connectionID)

    connectionID = connectionID + "/transactions"
    auth =  "Bearer " + token.to_s

    headers = {
      "Authorization"  => auth,

      }

    self.class.get("/connections/" + connectionID, :headers => headers).body

  end

  def refreshConnection(token, connectionID)

    connectionID = connectionID + "/refresh"
    auth =  "Bearer " + token.to_s

    headers = {
      "Authorization"  => auth,
      "Content-Type" => "application/json"
      }

    self.class.post("/connections/" + connectionID, :headers => headers)

  end

  def retrieveConnection(token, connectionID)
    
    auth =  "Bearer " + token.to_s
    
    headers = {
      "Authorization"  => auth,
      "Content-Type" => "application/json"
      }
    
    self.class.get("/connections/" + connectionID, :headers => headers).body

  end
  
  def updateConnection(token, connectionID, passkey)
    
    connectionID = connectionID
    auth =  "Bearer " + token.to_s
    
    headers = { 
      "Authorization"  => auth,
      "Content-Type" => "application/json"
      }
     
    self.class.put("/connections/" + connectionID, :headers => headers, body: {:password => passkey.to_s}.to_json).body
  
  end


  def anzsic_mappings
    @anzsic_hash = [{:anzsic => 4211,:category => 1},
                {:anzsic => 4212,:category => 1},
                {:anzsic => 4213,:category => 1},
                {:anzsic => 4214,:category => 1},
                {:anzsic => 4221,:category => 1},
                {:anzsic => 4222,:category => 1},
                {:anzsic => 4229,:category => 1},
                {:anzsic => 4231,:category => 1},
                {:anzsic => 4232,:category => 1},
                {:anzsic => 6711,:category => 1},
                {:anzsic => 6720,:category => 1},
                {:anzsic => 7311,:category => 1},
                {:anzsic => 7312,:category => 1},
                {:anzsic => 7313,:category => 1},
                {:anzsic => 3231,:category => 1},
                {:anzsic => 3232,:category => 1},
                {:anzsic => 3233,:category => 1},
                {:anzsic => 3234,:category => 1},
                {:anzsic => 3239,:category => 1},
                {:anzsic => 3011,:category => 1},

                {:anzsic => 3921,:category => 2},
                {:anzsic => 3922,:category => 2},
                {:anzsic => 4000,:category => 2},
                {:anzsic => 3911,:category => 2},
                {:anzsic => 3912,:category => 2},
                {:anzsic => 3913,:category => 2},
                {:anzsic => 4621,:category => 2},
                {:anzsic => 4622,:category => 2},
                {:anzsic => 4623,:category => 2},
                {:anzsic => 4720,:category => 2},
                {:anzsic => 4820,:category => 2},
                {:anzsic => 4900,:category => 2},
                {:anzsic => 6611,:category => 2},
                {:anzsic => 6619,:category => 2},
                {:anzsic => 9411,:category => 2},
                {:anzsic => 9412,:category => 2},
                {:anzsic => 9419,:category => 2},

                {:anzsic => 4110,:category => 3},
                {:anzsic => 4121,:category => 3},
                {:anzsic => 4122,:category => 3},
                {:anzsic => 4123,:category => 3},
                {:anzsic => 4129,:category => 3},

                {:anzsic => 4241,:category => 4},
                {:anzsic => 4242,:category => 4},
                {:anzsic => 4243,:category => 4},
                {:anzsic => 4244,:category => 4},
                {:anzsic => 4251,:category => 4},
                {:anzsic => 4252,:category => 4},
                {:anzsic => 4253,:category => 4},
                {:anzsic => 4259,:category => 4},
                {:anzsic => 4511,:category => 4},
                {:anzsic => 4512,:category => 4},
                {:anzsic => 4513,:category => 4},
                {:anzsic => 4520,:category => 4},
                {:anzsic => 4530,:category => 4},
                {:anzsic => 5010,:category => 4},
                {:anzsic => 8710,:category => 4},
                {:anzsic => 8010,:category => 4},
                {:anzsic => 8021,:category => 4},
                {:anzsic => 8022,:category => 4},
                {:anzsic => 8023,:category => 4},
                {:anzsic => 8024,:category => 4},
                {:anzsic => 8101,:category => 4},
                {:anzsic => 8102,:category => 4},
                {:anzsic => 8211,:category => 4},
                {:anzsic => 8212,:category => 4},
                {:anzsic => 8219,:category => 4},
                {:anzsic => 8220,:category => 4},
                {:anzsic => 9511,:category => 4},
                {:anzsic => 9491,:category => 4},
                {:anzsic => 9499,:category => 4},
                {:anzsic => 4271,:category => 4},
                {:anzsic => 5513,:category => 4},

                {:anzsic => 6310,:category => 5},
                {:anzsic => 6321,:category => 5},
                {:anzsic => 8401,:category => 5},
                {:anzsic => 8402,:category => 5},
                {:anzsic => 8511,:category => 5},
                {:anzsic => 8512,:category => 5},
                {:anzsic => 8520,:category => 5},
                {:anzsic => 8531,:category => 5},
                {:anzsic => 8532,:category => 5},
                {:anzsic => 8533,:category => 5},
                {:anzsic => 8534,:category => 5},
                {:anzsic => 8539,:category => 5},
                {:anzsic => 8591,:category => 5},
                {:anzsic => 8699,:category => 5},
                {:anzsic => 8601,:category => 5},
                {:anzsic => 8609,:category => 5},
                {:anzsic => 8790,:category => 5},
                {:anzsic => 9112,:category => 5},

                {:anzsic => 6322,:category => 6},
                {:anzsic => 5801,:category => 6},
                {:anzsic => 5802,:category => 6},
                {:anzsic => 5809,:category => 6},
                {:anzsic => 5910,:category => 6},
                {:anzsic => 5921,:category => 6},
                {:anzsic => 5922,:category => 6},
                {:anzsic => 5621,:category => 6},
                {:anzsic => 5622,:category => 6},
                {:anzsic => 2630,:category => 6},
                {:anzsic => 2640,:category => 6},
                {:anzsic => 2700,:category => 6},
                {:anzsic => 2811,:category => 6},
                {:anzsic => 2812,:category => 6},
                {:anzsic => 2911,:category => 6},
                {:anzsic => 2919,:category => 6},
                {:anzsic => 2921,:category => 6},
                {:anzsic => 2922,:category => 6},
                {:anzsic => 6632,:category => 6},

                {:anzsic => 4221,:category => 7},
                {:anzsic => 4222,:category => 7},
                {:anzsic => 4229,:category => 7},
                {:anzsic => 4272,:category => 7},
                {:anzsic => 4273,:category => 7},
                {:anzsic => 4274,:category => 7},
                {:anzsic => 5101,:category => 7},
                {:anzsic => 5102,:category => 7},
                {:anzsic => 6931,:category => 7},
                {:anzsic => 6932,:category => 7},
                {:anzsic => 6970,:category => 7},
                {:anzsic => 9531,:category => 7},
                {:anzsic => 9532,:category => 7},
                {:anzsic => 6411,:category => 7},
                {:anzsic => 6419,:category => 7},
                ]
  end

end
