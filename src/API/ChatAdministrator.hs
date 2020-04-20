-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatAdministrator where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatAdministrator = 
 ChatAdministrator { is_owner :: Bool, custom_title :: String, user_id :: Int }  -- deriving (Show)

instance T.ToJSON ChatAdministrator where
 toJSON (ChatAdministrator { is_owner = is_owner, custom_title = custom_title, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatAdministrator", "is_owner" A..= is_owner, "custom_title" A..= custom_title, "user_id" A..= user_id ]
-- chatAdministrator ChatAdministrator  { is_owner :: Bool, custom_title :: String, user_id :: Int } 

