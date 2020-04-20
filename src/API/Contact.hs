-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Contact where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Contact = 
 Contact { user_id :: Int, vcard :: String, last_name :: String, first_name :: String, phone_number :: String }  -- deriving (Show)

instance T.ToJSON Contact where
 toJSON (Contact { user_id = user_id, vcard = vcard, last_name = last_name, first_name = first_name, phone_number = phone_number }) =
  A.object [ "@type" A..= T.String "contact", "user_id" A..= user_id, "vcard" A..= vcard, "last_name" A..= last_name, "first_name" A..= first_name, "phone_number" A..= phone_number ]
-- contact Contact  { user_id :: Int, vcard :: String, last_name :: String, first_name :: String, phone_number :: String } 

