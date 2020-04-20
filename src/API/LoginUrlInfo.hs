-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LoginUrlInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LoginUrlInfo = 
 LoginUrlInfoOpen { skip_confirm :: Bool, url :: String }  
 | LoginUrlInfoRequestConfirmation { request_write_access :: Bool, bot_user_id :: Int, domain :: String, url :: String }  -- deriving (Show)

instance T.ToJSON LoginUrlInfo where
 toJSON (LoginUrlInfoOpen { skip_confirm = skip_confirm, url = url }) =
  A.object [ "@type" A..= T.String "loginUrlInfoOpen", "skip_confirm" A..= skip_confirm, "url" A..= url ]

 toJSON (LoginUrlInfoRequestConfirmation { request_write_access = request_write_access, bot_user_id = bot_user_id, domain = domain, url = url }) =
  A.object [ "@type" A..= T.String "loginUrlInfoRequestConfirmation", "request_write_access" A..= request_write_access, "bot_user_id" A..= bot_user_id, "domain" A..= domain, "url" A..= url ]
-- loginUrlInfoOpen LoginUrlInfo  { skip_confirm :: Bool, url :: String } 

-- loginUrlInfoRequestConfirmation LoginUrlInfo  { request_write_access :: Bool, bot_user_id :: Int, domain :: String, url :: String } 

