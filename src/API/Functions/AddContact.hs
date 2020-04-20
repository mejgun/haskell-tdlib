-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddContact where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact

--main = putStrLn "ok"

data AddContact = 
 AddContact { share_phone_number :: Bool, contact :: Contact.Contact }  -- deriving (Show)

instance T.ToJSON AddContact where
 toJSON (AddContact { share_phone_number = share_phone_number, contact = contact }) =
  A.object [ "@type" A..= T.String "addContact", "share_phone_number" A..= share_phone_number, "contact" A..= contact ]
-- addContact AddContact  { share_phone_number :: Bool, contact :: Contact.Contact } 

